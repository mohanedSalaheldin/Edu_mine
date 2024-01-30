import 'package:dartz/dartz.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/courses_repository.dart';

class GetAllCoursesUseCase {
  final CoursesRepository repository;

  GetAllCoursesUseCase({required this.repository});

  Future<Either<Failure, List<CourseEntity>>> call() {
    return repository.getAllCourses();
  }
}
