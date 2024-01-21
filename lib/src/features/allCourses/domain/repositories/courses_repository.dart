import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/failures.dart';

abstract class CoursesRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  Future<Either<Failure, Unit>> enrollInCourse({required String courseID});
  Future<Either<Failure, bool>> isEnrolledInCourse({required String courseID});
}
