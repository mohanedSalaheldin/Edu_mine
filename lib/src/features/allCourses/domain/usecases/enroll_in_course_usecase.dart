import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/allCourses/domain/repositories/courses_repository.dart';

class EnrollInCourseUseCase {
  final CoursesRepository repository;

  EnrollInCourseUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String courseID}) {
    return repository.enrollInCourse(courseID: courseID);
  }
}
