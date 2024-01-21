class CourseEntity {
  final String courseName;
  final String courseID;
  final String tag;
  final String instructor;
  final int allSections;
  final int doneSections;
  final String description;
  final String rate;
  final String reviews;
  final String poster;

  CourseEntity({
    required this.description,
    required this.courseName,
    required this.courseID,
    required this.tag,
    required this.instructor,
    required this.allSections,
    required this.doneSections,
    required this.rate,
    required this.reviews,
    required this.poster,
  });
}
