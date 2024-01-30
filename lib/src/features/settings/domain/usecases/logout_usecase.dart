import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class LogOutUsecase {
  final SettingsRepository repository;

  LogOutUsecase({required this.repository});
  Future<Either<Failure, Unit>> call({required String themeName}) {
    return repository.logout();
  }
}
