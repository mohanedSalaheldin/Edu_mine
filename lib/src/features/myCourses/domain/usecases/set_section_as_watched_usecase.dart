import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/my_courses_repository.dart';

class SetSectionAsWatchedUseCase {
  final MyCoursesRepository repository;

  SetSectionAsWatchedUseCase({required this.repository});
  Future<Either<Failure, Unit>> call({required String courseID,required String sectionURL}) {
    return repository.setSectionAsWatched(courseID: courseID, sectionURL: sectionURL);
  }
}
