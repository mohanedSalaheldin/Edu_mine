import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntery {
  static var db = FirebaseFirestore.instance;

  static void addLecture() async {
    String courseID = 'Mu8aSB7RKh5YopxJFspG';
    Map<String, dynamic> data = {
      'title': 'String',
      'description': 'Some descriotion words',
      'url': 'https://youtu.be/NDspie55GpI?si=QAJtp0cLy3IJt7CA',
      'number': 1,
      'isWatched': false,
    };
    db
        .collection('courses')
        .doc(courseID)
        .collection('lectures')
        .add(data)
        .then((value) {
      print('******************( Lecture Added )*****************');
    });
  }

  static void addCourse() async {
    Map<String, dynamic> data = {};
    DocumentReference<Map<String, dynamic>> documentReference =
        await db.collection('courses').add(data);
    String courseID = documentReference.id;
    db.collection('courses').doc(courseID).set({}).then((value) {
      print('******************( Course Added )*****************');
    });
  }
}
