import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../repositories/my_courses_repository.dart';

class MyCoursesGetUserCoursesUsecase {
  final MyCoursesRepository repository;

  MyCoursesGetUserCoursesUsecase({required this.repository});
  Future<Either<Failure, List<CourseEntity>>> call({required String uID}) {
    return repository.getUserCourses(uID: uID);
  }
}

