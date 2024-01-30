import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/section_entity.dart';
import '../repositories/my_courses_repository.dart';

class GetAllSectionsUsecase {
  final MyCoursesRepository repository;

  GetAllSectionsUsecase({required this.repository});
  Future<Either<Failure, List<SectionEntity>>> call({required String courseID}) {
    return repository.getAllSections(courseID: courseID);
  }
}
 
