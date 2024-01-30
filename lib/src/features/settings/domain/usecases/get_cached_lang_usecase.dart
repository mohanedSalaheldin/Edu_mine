import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class GetCachedLangUsecase {
  final SettingsRepository repository;

  GetCachedLangUsecase({required this.repository});
  Future<Either<Failure, String>> call() {
    return repository.getCachedLang();
  }
}
