import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/allCourses/domain/repositories/courses_repository.dart';

class GetAllCoursesUseCase {
  final CoursesRepository repository;

  GetAllCoursesUseCase({required this.repository});

  Future<Either<Failure, List<CourseEntity>>> call() {
    return repository.getAllCourses();
  }
}
