import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/src/core/models/couses_model.dart';

abstract class MyCoursesRemoteDataSource {
  Future<List<CourseModel>> getUserCourses({required String uID});
}

class MyCoursesRemoteDataSourceImpl implements MyCoursesRemoteDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;

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
        await FirebaseFirestore.instance.collection('courses').get();
    courses =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return CourseModel.fromJosn(doc.data());
    }).toList();
    return courses;
  }
}

/*
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


 */
