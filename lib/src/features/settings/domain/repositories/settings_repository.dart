import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Unit>> cacheAppTheme({required String themeName});
  Future<Either<Failure, String>> getCachedTheme();
  Future<Either<Failure, Unit>> cacheAppLang({required String langCode});
  Future<Either<Failure, String>> getCachedLang();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Map<String,dynamic>>> getUserData();
}
