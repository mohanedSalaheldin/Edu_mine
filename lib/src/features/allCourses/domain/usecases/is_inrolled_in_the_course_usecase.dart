import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/courses_repository.dart';

class IsEnrolledInCourseUseCase {
  final CoursesRepository repository;

  IsEnrolledInCourseUseCase({required this.repository});

  Future<Either<Failure, bool>> call({required String courseID}) {
    return repository.isEnrolledInCourse(courseID: courseID);
  }
}
 