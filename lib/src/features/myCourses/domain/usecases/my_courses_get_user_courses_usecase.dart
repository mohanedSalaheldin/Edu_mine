import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';

class MyCoursesGetUserCoursesUsecase {
  final MyCoursesRepository repository;

  MyCoursesGetUserCoursesUsecase({required this.repository});
  Future<Either<Failure, List<CourseEntity>>> call({required String uID}) {
    return repository.getUserCourses(uID: uID);
  }
}
