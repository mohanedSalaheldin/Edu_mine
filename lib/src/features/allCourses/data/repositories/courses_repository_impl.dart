import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/allCourses/data/datasources/courses_remote_datasource.dart';
import 'package:e_learning/src/features/allCourses/domain/repositories/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesRemoteDataSource _dataSource;
  // final NetworkInfo _networkInfo;

  CoursesRepositoryImpl({required CoursesRemoteDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      var response = await _dataSource.getAllCourses();
      return Right(response);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> enrollInCourse(
      {required String courseID}) async {
    try {
      await _dataSource.enrollInCourse(courseID: courseID);
      return const Right(unit);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isEnrolledInCourse(
      {required String courseID}) async {
    try {
      bool response = await _dataSource.isEnrolledInCourse(courseID: courseID);
      return Right(response);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }
}
