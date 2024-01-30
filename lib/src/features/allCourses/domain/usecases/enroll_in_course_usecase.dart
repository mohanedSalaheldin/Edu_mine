import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/courses_repository.dart';

class EnrollInCourseUseCase {
  final CoursesRepository repository;

  EnrollInCourseUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String courseID}) {
    return repository.enrollInCourse(courseID: courseID);
  }
}
