import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/src/core/models/couses_model.dart';
import 'package:e_learning/src/features/home/data/models/home_monitor_model.dart';
import 'package:e_learning/src/features/home/data/models/home_user_data_model.dart';

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
    HomeUserDataModel model = HomeUserDataModel.fromJson(respose.data()!);
    return Future.value(model);
  }

  @override
  Future<List<MonitorModel>> getMonitors() async {
    List<MonitorModel> monitors = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('monitors').get();
    monitors =
        snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      return MonitorModel.fromJosn(doc.data());
    }).toList();
    return monitors;
  }

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
