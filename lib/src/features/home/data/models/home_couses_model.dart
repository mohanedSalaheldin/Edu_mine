import 'package:e_learning/src/features/home/domain/entities/my_courses_entity.dart';

class CourseModel extends CourseEntity {
  CourseModel(
      {required super.courseName,
      required super.courseID,
      required super.tag,
      required super.instructor,
      required super.allSections,
      required super.doneSections});
  factory CourseModel.fromJosn(Map<String, dynamic> json) {
    return CourseModel(
      courseName: json['course_name'],
      courseID: json['course_id'],
      tag: json['tag'],
      instructor: json['instructor'],
      allSections: json['all_sections'],
      doneSections: json['done_sections'],
    );
  }
}
