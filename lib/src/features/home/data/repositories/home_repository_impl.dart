import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/network/network_info.dart';
import '../datasources/my_courses_remote_datasourse.dart';
import '../../domain/entities/home_user_entity.dart';
import '../../domain/entities/monitors_entity.dart';
import '../../../../core/entities/my_courses_entity.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, HomeUserEntity>> getUserData(
      {required String uID}) async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSource.getUserData(uID: uID);
        return Right(res);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<MonitorEntity>>> getMonitors() async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSource.getMonitors();
        return Right(res);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

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
}
