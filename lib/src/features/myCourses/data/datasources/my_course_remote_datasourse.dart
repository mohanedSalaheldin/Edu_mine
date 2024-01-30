
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/models/couses_model.dart';
import '../models/section_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class MyCoursesRemoteDataSource {
  Future<List<CourseModel>> getUserCourses({required String uID});
  Future<List<SectionModel>> getAllCourseSections({required String courseID});
  Future<Unit> setSectionAsWatched(
      {required String courseID, required String sectionURL});
}

class MyCoursesRemoteDataSourceImpl implements MyCoursesRemoteDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;
  String uID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<List<CourseModel>> getUserCourses({required String uID}) async {
    List<CourseModel> coursesModels = [];
    List<Map<String, dynamic>> enrolledCourses = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('users').doc(uID).collection('courses').get();
    enrolledCourses =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return doc.data();
    }).toList();

    List<CourseModel> allCourses = await _getAllCourses();
    for (CourseModel elementOfAll in allCourses) {
      for (var elementOfEnrolled in enrolledCourses) {
        if (elementOfEnrolled['courseID'] == elementOfAll.courseID) {
          coursesModels.add(CourseModel(
              courseName: elementOfAll.courseName,
              courseID: elementOfAll.courseID,
              tag: elementOfAll.tag,
              instructor: elementOfAll.instructor,
              allSections: elementOfAll.allSections,
              doneSections: elementOfEnrolled['done_sections'],
              rate: elementOfAll.rate,
              reviews: elementOfAll.reviews,
              poster: elementOfAll.poster,
              description: elementOfAll.description));
        }
      }
    }
    return coursesModels;
  }

  Future<List<CourseModel>> _getAllCourses() async {
    List<CourseModel> courses = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('courses').get();
    courses =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return CourseModel.fromJosn(doc.data());
    }).toList();
    return courses;
  }

  @override
  Future<List<SectionModel>> getAllCourseSections(
      {required String courseID}) async {
    List<SectionModel> sections = [];
    DocumentSnapshot<Map<String, dynamic>> snip = await store
        .collection('users')
        .doc(uID)
        .collection('courses')
        .doc(courseID)
        .get();
    List watchedLectures = snip.data()!['watchedSection'];
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('courses')
        .doc(courseID)
        .collection('lectures')
        .orderBy('number')
        .get();

// isWatched
    sections =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      Map<String, dynamic> data = doc.data();

      if (watchedLectures.contains(data['url'])) {
        data['isWatched'] = true;
      } else {
        data['isWatched'] = false;
      }
      // data['isWatched'] =
      return SectionModel.fromJson(data);
    }).toList();

    // for (var element in sections) {
    //   if (watchedLectures.contains(element.url)) {}
    // }
    return sections;
  }

  @override
  Future<Unit> setSectionAsWatched({
    required String courseID,
    required String sectionURL,
  }) async {
    // print(uID);
    DocumentSnapshot<Map<String, dynamic>> snip = await store
        .collection('users')
        .doc(uID)
        .collection('courses')
        .doc(courseID)
        .get();

    List watchedLectures = snip.data()!['watchedSection'];
    Map<String, dynamic> data = snip.data()!;
    watchedLectures.add(sectionURL);
    data['watchedSection'] = watchedLectures;
    data['done_sections'] = watchedLectures.length;

    store
        .collection('users')
        .doc(uID)
        .collection('courses')
        .doc(courseID)
        .set(data)
        .then((value) {
      // print('*********************************************');
      // print(sectionURL);
      // print('*********************************************');
    });

    return Future.value(unit);
  }
}
