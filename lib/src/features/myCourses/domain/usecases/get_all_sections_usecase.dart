import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';

class GetAllSectionsUsecase {
  final MyCoursesRepository repository;

  GetAllSectionsUsecase({required this.repository});
  Future<Either<Failure, List<SectionEntity>>> call({required String courseID}) {
    return repository.getAllSections(courseID: courseID);
  }
}
 
