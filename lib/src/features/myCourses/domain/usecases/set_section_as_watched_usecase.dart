import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';

class SetSectionAsWatchedUseCase {
  final MyCoursesRepository repository;

  SetSectionAsWatchedUseCase({required this.repository});
  Future<Either<Failure, Unit>> call({required String courseID,required String sectionURL}) {
    return repository.setSectionAsWatched(courseID: courseID, sectionURL: sectionURL);
  }
}
