import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/settings_repository.dart';

class SettingsGetUserDataUsecase {
  final SettingsRepository repository;

  SettingsGetUserDataUsecase({required this.repository});
  Future<Either<Failure, Map<String, dynamic>>> call() {
    return repository.getUserData();
  }
}
