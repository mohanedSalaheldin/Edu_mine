import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../repositories/home_repository.dart';

class HomeGetUserCoursesUsecase {
  final HomeRepository repository;

  HomeGetUserCoursesUsecase({required this.repository});
  Future<Either<Failure, List<CourseEntity>>> call({required String uID}) {
    return repository.getUserCourses(uID: uID);
  }
}
