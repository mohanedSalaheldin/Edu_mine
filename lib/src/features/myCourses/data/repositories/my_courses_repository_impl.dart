import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/utils/network/network_info.dart';
import '../datasources/my_course_remote_datasourse.dart';
import '../../domain/entities/section_entity.dart';
import '../../domain/repositories/my_courses_repository.dart';

class MyCoursesRepositoryImpl implements MyCoursesRepository {
  final MyCoursesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MyCoursesRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CourseEntity>>> getUserCourses(
      {required String uID}) async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSource.getUserCourses(uID: uID);
        return Right(res);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<SectionEntity>>> getAllSections(
      {required String courseID}) async {
    if (await networkInfo.isConnected) {
      try {
        var res =
            await remoteDataSource.getAllCourseSections(courseID: courseID);
        return Right(res);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setSectionAsWatched(
      {required String courseID, required String sectionURL}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.setSectionAsWatched(
            courseID: courseID, sectionURL: sectionURL);
        return const Right(unit);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
