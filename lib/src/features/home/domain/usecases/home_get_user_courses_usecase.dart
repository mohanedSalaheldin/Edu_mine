import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';

class HomeGetUserCoursesUsecase {
  final HomeRepository repository;

  HomeGetUserCoursesUsecase({required this.repository});
  Future<Either<Failure, List<CourseEntity>>> call({required String uID}) {
    return repository.getUserCourses(uID: uID);
  }
}
