import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/src/features/home/data/models/home_couses_model.dart';
import 'package:e_learning/src/features/home/data/models/home_monitor_model.dart';
import 'package:e_learning/src/features/home/data/models/home_user_data_model.dart';
import 'package:flutter/material.dart';

abstract class HomeRemoteDataSource {
  Future<HomeUserDataModel> getUserData({required String uID});
  Future<List<CourseModel>> getUserCourses({required String uID});
  Future<List<MonitorModel>> getMonitors();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future<HomeUserDataModel> getUserData({required String uID}) async {
    DocumentSnapshot<Map<String, dynamic>> respose =
        await store.collection('users').doc(uID).get();
    debugPrint('-----------------------------------------------');
    debugPrint(jsonEncode(respose.data()));
    debugPrint('-----------------------------------------------');
    HomeUserDataModel model = HomeUserDataModel.fromJson(respose.data()!);
    return Future.value(model);
  }

  @override
  Future<List<MonitorModel>> getMonitors() {
    // TODO: implement getMonitors
    // respose =
    // await store.collection('users').doc(uID).get();

    throw UnimplementedError();
  }

  @override
  Future<List<CourseModel>> getUserCourses({required String uID}) async {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        // store.collection('users').doc(uID).collection('courses').get();

    List<CourseModel> courses = [];
    snapshot.
    snapshot.forEach((element) {
      element.docs.map((e) {
        print(e.data());
        return courses.add(CourseModel.fromJosn(e.data()));
      });
    });
    // docs.map(
    //   (e) {
    //     print(e.data());
    //     return courses.add(CourseModel.fromJosn(e.data()));
    //   },
    // );
    debugPrint('-----------------------------------------------');
    debugPrint(courses.toString());
    debugPrint('-----------------------------------------------');
    return courses;

    // throw UnimplementedError();
  }
}
