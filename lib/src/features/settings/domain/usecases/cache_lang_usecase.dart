
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class CacheAppLangUsecase {
  final SettingsRepository repository;

  CacheAppLangUsecase({required this.repository});
  Future<Either<Failure, Unit>> call({required String langCode}) {
    return repository.cacheAppLang(langCode: langCode);
  }
}
 
