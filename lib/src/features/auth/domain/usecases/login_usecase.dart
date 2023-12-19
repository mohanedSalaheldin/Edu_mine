

import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/auth/domain/entities/user_entity.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, UserEntiy>> call(
      {required String email, required String password}) async {
    return await authRepository.login(email: email, password: password);
  }
}
