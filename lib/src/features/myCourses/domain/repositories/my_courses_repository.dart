import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';

abstract class MyCoursesRepository {
  Future<Either<Failure, List<CourseEntity>>> getUserCourses({required String uID});
}
