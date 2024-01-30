
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class GetCachedThemeUsecase {
  final SettingsRepository repository;

  GetCachedThemeUsecase({required this.repository});
  Future<Either<Failure, String>> call() {
    return repository.getCachedTheme();
  }
}
 
