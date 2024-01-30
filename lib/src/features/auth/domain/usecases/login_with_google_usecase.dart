import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase {
  final AuthRepository authRepository;

  LoginWithGoogleUseCase({required this.authRepository});

  Future<Either<Failure, UserEntiy>> call() async {
    return await authRepository.loginWithGoogle();
  }
}
