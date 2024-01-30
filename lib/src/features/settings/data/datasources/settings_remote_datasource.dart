import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SettingsRemoteDataSource {
  Future<Map<String, dynamic>> getUserData();
  Future<Unit> logout();
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getUserData() async {
    String uID = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> respose =
        await FirebaseFirestore.instance.collection('users').doc(uID).get() as Map<String, dynamic>;
        return Future.value(respose);
  }

  @override
  Future<Unit> logout() async {
    await FirebaseAuth.instance.signOut();
    return unit;
  }
}
