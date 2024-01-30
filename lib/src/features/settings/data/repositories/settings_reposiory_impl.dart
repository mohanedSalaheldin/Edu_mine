import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/network/network_info.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';
import '../datasources/settings_remote_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;
  final SettingsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SettingsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> cacheAppLang({required String langCode}) async {
    try {
      await localDataSource.cacheData(key: 'lang', value: langCode);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cacheAppTheme(
      {required String themeName}) async {
    try {
      await localDataSource.cacheData(key: 'theme', value: themeName);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getCachedLang() async {
    try {
      String response = await localDataSource.getCachedData(key: 'lang');
      return Right(response);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getCachedTheme() async {
    try {
      String response = await localDataSource.getCachedData(key: 'theme');
      return Right(response);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout();
        return const Right(unit);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData() async {
    if (await networkInfo.isConnected) {
      try {
        Map<String, dynamic> response = await remoteDataSource.getUserData();
        return Right(response);
      } catch (e) {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
