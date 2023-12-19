

import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/auth/domain/entities/user_entity.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, UserEntiy>> call(  {required String email, required String password, required String name}) async {
    return await authRepository.register(email: email,password: password,name: name);
  }
}
