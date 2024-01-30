

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, UserEntiy>> call(  {required String email, required String password, required String name}) async {
    return await authRepository.register(email: email,password: password,name: name);
  }
}
