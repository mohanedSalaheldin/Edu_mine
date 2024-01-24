import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntery {
  static var db = FirebaseFirestore.instance;

  static void addLecture() async {
    List<String> names = [
      "Intro",
      "Single-responsibility",
      "Open-Closed",
      "Liskov substitution",
      "Interface segregation",
      "Dependency inversion"
    ];
    List<String> disc = [
      "Introduction",
      "Single Responsibility Principle",
      "Open/Closed Principle",
      "Liskov Substitution Principle",
      "Interface Segregation Principle",
      "Dependency Inversion Principle"
    ];
    List<String> links = [
      "https://youtu.be/pKo7S70WiKY?si=hwLk2WrHRmjpL5Cj",
      "https://youtu.be/KF1bCE2t8Rw?si=0DCO8_ooOEqITr_X",
      "https://youtu.be/XADR7pkUgZk?si=Pz5BkpU-0VzEHvSs",
      "https://youtu.be/pUneavp1gEA?si=y1VY9ix2HR6AR7-d",
      "https://youtu.be/kQK2jVtHrGI?si=GiCJKXXlA3O2G_KP",
      "https://youtu.be/heJxePP7ViU?si=DShHfjIzY-tckxU1",
  ];

    String courseID = 'dBOTfY3UxEux9pr4ctvR';

    for (var i = 0; i < names.length; i++) {
      DocumentReference<Map<String, dynamic>> documentReference = await db
          .collection('courses')
          .doc(courseID)
          .collection('lectures')
          .add({"sa": "as"});
      String sectionID = documentReference.id;
      Map<String, dynamic> data = {
        'title': names[i],
        'description': disc[i],
        'url': links[i],
        'number': i + 1,
        'id': sectionID,
      };
      await db
          .collection('courses')
          .doc(courseID)
          .collection('lectures')
          .doc(sectionID)
          .set(data)
          .then((value) {
        print('******************( Section Added )*****************');
      });
    }
  }

  static void addCourse() async {
    Map<String, dynamic> data = {};
    DocumentReference<Map<String, dynamic>> documentReference =
        await db.collection('courses').add(data);
    String courseID = documentReference.id;
    db.collection('courses').doc(courseID).set(data).then((value) {
      print('******************( Course Added )*****************');
    });
  }
}
