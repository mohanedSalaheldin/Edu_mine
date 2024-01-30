
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class CacheAppThemeUsecase {
  final SettingsRepository repository;

  CacheAppThemeUsecase({required this.repository});
  Future<Either<Failure, Unit>> call({required String themeName}) {
    return repository.cacheAppTheme(themeName: themeName);
  }
}
 
