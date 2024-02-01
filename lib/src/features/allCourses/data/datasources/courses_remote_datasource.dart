import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/couses_model.dart';
// import 'package:flutter/material.dart';

abstract class CoursesRemoteDataSource {
  Future<List<CourseModel>> getAllCourses();
  Future<Unit> enrollInCourse({required String courseID});
  Future<bool> isEnrolledInCourse({required String courseID});
}

class CoursesRemoteDataSourceImpl implements CoursesRemoteDataSource {
  @override
  Future<List<CourseModel>> getAllCourses() async {
    List<CourseModel> courses = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('courses').get();
    courses =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return CourseModel.fromJosn(doc.data());
    }).toList();
    return courses;
  }

  @override
  Future<Unit> enrollInCourse({required String courseID}) async {
    final String uID = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .collection('courses')
        .doc(courseID)
        .set({
      'courseID': courseID,
      'done_sections': 0,
      'watchedSection': [],
    });
    return Future.value(unit);
  }

  @override
  Future<bool> isEnrolledInCourse({required String courseID}) async {
    bool isFound = false;
    final String uID = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(uID)
        .collection('courses')
        .get();
    isFound = snapshot.docs.any((element) {
      if (element.data()['courseID'] == courseID) {
        return true;
      }
      return element.data()['courseID'] == courseID;
    });
    return isFound;
  }
}
