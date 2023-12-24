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
  Future<List<MonitorModel>> getMonitors() async {
    debugPrint(
        '------------------------(MONITORS IN DATASOURSES)-----------------------');
    List<MonitorModel> monitors = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('monitors').get();
    monitors =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      print(doc.data());
      return MonitorModel.fromJosn(doc.data());
    }).toList();
    print(monitors);
    debugPrint(
        '------------------------(MONITORS IN DATASOURSES)-----------------------');
    return monitors;
  }

  @override
  Future<List<CourseModel>> getUserCourses({required String uID}) async {
    debugPrint(
        '------------------------(COURSES IN DATASOURSES)-----------------------');
    List<CourseModel> courses = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('users').doc(uID).collection('courses').get();
    courses =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      print(doc.data());
      return CourseModel.fromJosn(doc.data());
    }).toList();
    print(courses);
    debugPrint('------------------------(COURSES)-----------------------');
    return courses;
  }
}
