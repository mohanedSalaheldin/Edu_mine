import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> googleSignIn();
  Future<UserModel> googleRegister();
  Future<UserModel> emailLogin(
      {required String email, required String password});
  Future<UserModel> emailRegister(
      {required String email, required String password, required String name});
  Future<Unit> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Future<UserModel> emailLogin(
      {required String email, required String password}) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    debugPrint(user.toString());
    return const UserModel(name: '', email: '', password: '', uID: '');
  }

  @override
  Future<UserModel> emailRegister(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _saveUserDataInFireStore(userCredential, name: name);
    return UserModel(
      name: name,
      email: email,
      password: password,
      uID: userCredential.user!.uid,
    );
  }

  @override
  Future<UserModel> googleRegister() async {
    return const UserModel(name: '', email: '', password: '', uID: '');
  }

  @override
  Future<UserModel> googleSignIn() async {
    UserCredential userCredential = await _signInWithGoogle();
    _saveUserDataInFireStore(userCredential);
    return const UserModel(name: '', email: '', password: '', uID: '');
  }

  @override
  Future<Unit> signOut() {
    throw UnimplementedError();
  }

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  void _saveUserDataInFireStore(UserCredential userCredential,
      {String? name}) async {
    debugPrint('DocumentSnapshot added with ID');
    await _store
        .collection('users')
        .doc(
          userCredential.user!.uid,
        )
        .set(
      {
        'uID': userCredential.user!.uid,
        'name': name ?? userCredential.user!.displayName,
        'email': userCredential.user!.email,
      },
    );
  }
}
