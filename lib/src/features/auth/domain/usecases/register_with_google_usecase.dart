

import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/auth/domain/entities/user_entity.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithGoogleUseCase {
  final AuthRepository authRepository;

  RegisterWithGoogleUseCase({required this.authRepository});

  Future<Either<Failure, UserEntiy>> call() async {
    return await authRepository.registerWithGoogle();
  }
}
