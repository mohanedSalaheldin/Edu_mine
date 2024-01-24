import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';

abstract class MyCoursesRepository {
  Future<Either<Failure, List<CourseEntity>>> getUserCourses({required String uID});
  Future<Either<Failure, List<SectionEntity>>> getAllSections({required String courseID});
  Future<Either<Failure, Unit>> setSectionAsWatched({required String courseID,required String sectionURL});
}
