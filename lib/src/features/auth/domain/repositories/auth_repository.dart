import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntiy>> login(
      {required String email, required String password});
  Future<Either<Failure, UserEntiy>> loginWithGoogle();
  Future<Either<Failure, UserEntiy>> register(
      {required String email, required String password, required String name});
  Future<Either<Failure, Unit>> signout();
}
