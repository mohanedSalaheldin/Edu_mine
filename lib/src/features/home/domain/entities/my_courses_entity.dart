class CourseEntity {
  final String courseName;
  final String courseID;
  final String tag;
  final String  instructor;
  final int allSections;
  final int doneSections;

  CourseEntity({required this.courseName, required this.courseID, required this.tag, required this.instructor, required this.allSections, required this.doneSections});
}
