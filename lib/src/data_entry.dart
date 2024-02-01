import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntery {
  static var db = FirebaseFirestore.instance;

  static void addLecture() async {
    List<String> names = [
      'Lesson 1',
      'Lesson 2',
      'Lesson 3',
      'Lesson 4',
      'Lesson 5',
      'Lesson 6',
      'Lesson 7',
      'Lesson 8',
      'Lesson 9',
      'Lesson 10',
      'Lesson 11',
      'Lesson 12'
    ];
    List<String> disc = [
      'How to understand Quran 1',
      'How to understand Quran 2',
      'How to understand Quran 3',
      'How to understand Quran 4',
      'How to understand Quran 5',
      'How to understand Quran 6',
      'How to understand Quran 7',
      'How to understand Quran 8',
      'How to understand Quran 9',
      'How to understand Quran 10',
      'How to understand Quran 11',
      'How to understand Quran 12'
    ];
    List<String> links = [
      "https://youtu.be/4SEHQFpofu0?si=ItQKSih9H4nDgsuP",
      "https://youtu.be/3LX-vs0T77E?si=ScPE9yuZaOqH_Rkk",
      "https://youtu.be/5uahA3sXD28?si=Jb5prtzBco7HleeB",
      "https://youtu.be/v948auzMxsw?si=VnUynW1RKFOpfETR",
      "https://youtu.be/OygoKhmyEoU?si=q1346ijXMTMAc2fq",
      "https://youtu.be/GUSUhvwGb9E?si=Ews29wuF16DfkLL0",
      "https://youtu.be/1N0okemY6JQ?si=jYO27f6I45XfTa38",
      "https://youtu.be/elvrdcrS7BE?si=Q_X3wyGrlBdRQ85M",
      "https://youtu.be/CYpicok4lJk?si=1TRXJZUf1yDGyLZG",
      "https://youtu.be/Emwi2HerJ0Q?si=g8Un5syd1tjV0a11",
      "https://youtu.be/6ScxNDGVxVs?si=nKV7vDx5Vv6WQD5T",
      "https://youtu.be/7_GFuAhVbVg?si=2eJyJ3k01NZRHU4C"
    ];

    String courseID = 'xssnKN7KN2or7tkdeNP0';

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
  } //xssnKN7KN2or7tkdeNP0

  static void addCourse() async {
    Map<String, dynamic> data = {
      "poster":
          "https://i.ytimg.com/vi/4SEHQFpofu0/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBRvPm9h73nES6Simye0M7TRO0F8Q",
      "id": "xssnKN7KN2or7tkdeNP0",
      "instructor": "Arabic 101",
      "rate": "5.0",
      "reviews": "78",
      "tag": "#linguistics",
      "description":
          "The Read & Understand Quranic Arabic course is an advanced level program designed to deepen participants' proficiency in reading and comprehending Quranic Arabic. Building on foundational knowledge, this course focuses on enhancing learners' understanding of Arabic grammar, vocabulary, and syntax, enabling them to grasp complex Quranic verses. Through targeted exercises and practical examples, participants will develop the skills necessary to navigate and interpret Quranic texts at an intermediate level. This course serves as a crucial step for individuals seeking a more profound connection with the linguistic intricacies of the Quran.",
      "#ofLecture": 12,
      "name": "Read & Understand Quranic Arabic",
    };
    // DocumentReference<Map<String, dynamic>> documentReference =
    await db
        .collection('courses')
        .doc('xssnKN7KN2or7tkdeNP0')
        .set(data)
        .then((value) {
      print('******************( Course Added )*****************');
    });
    // String courseID = documentReference.id;
    // db.collection('courses').doc(courseID).set(data).then((value) {
    //   print('******************( Course Added )*****************');
    // });
  }
}
