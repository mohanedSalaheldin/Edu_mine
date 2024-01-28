import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/utils/consts/constatnts.dart';

class CourseModel extends CourseEntity {
  CourseModel(
      {required super.courseName,
      required super.courseID,
      required super.tag,
      required super.instructor,
      required super.allSections,
      required super.doneSections,
      required super.rate,
      required super.reviews,
      required super.poster,
      required super.description});
  factory CourseModel.fromJosn(Map<String, dynamic> json) {
    return CourseModel(
      courseName: json['name'],
      courseID: json['id'],
      rate: json['rate'],
      reviews: json['reviews'],
      poster: json['poster'],
      tag: json['tag'],
      instructor: json['instructor'],
      allSections: json['#ofLecture'],
      doneSections: json['done_sections'] ?? userCoursesIsEmptyCode,
      description: json['description'],
    );
  }
}
