import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/myCourses/data/datasources/home_remote_datasourse.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';

class MyCoursesRepositoryImpl implements MyCoursesRepository {
  final MyCoursesRemoteDataSource remoteDataSource;

  MyCoursesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CourseEntity>>> getUserCourses(
      {required String uID}) async {
    try {
      var res = await remoteDataSource.getUserCourses(uID: uID);
      return Right(res);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<SectionEntity>>> getAllSections({required String courseID})async {
    try {
      var res = await remoteDataSource.getAllCourseSections(courseID: courseID);
      return Right(res);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }
}
