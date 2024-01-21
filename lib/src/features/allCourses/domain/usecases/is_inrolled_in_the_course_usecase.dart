import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/allCourses/domain/repositories/courses_repository.dart';

class IsEnrolledInCourseUseCase {
  final CoursesRepository repository;

  IsEnrolledInCourseUseCase({required this.repository});

  Future<Either<Failure, bool>> call({required String courseID}) {
    return repository.isEnrolledInCourse(courseID: courseID);
  }
}
 