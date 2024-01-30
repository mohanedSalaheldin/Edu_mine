import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call(
      {required String email, required String password}) async {
    return await authRepository.signout();
  }
}
