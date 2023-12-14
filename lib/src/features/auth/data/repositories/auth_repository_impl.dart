import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/core/utils/network/network_info.dart';
import 'package:e_learning/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_learning/src/features/auth/domain/entities/user_entity.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntiy>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        UserEntiy re = await authRemoteDataSource.emailLogin(
            email: email, password: password);
        return Right(re);
      } on Exception catch (e) {
        print(e.toString());
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntiy>> loginWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        UserEntiy re = await authRemoteDataSource.googleSignIn();
        return Right(re);
      } on Exception catch (e) {
        print(e.toString());
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }


  

  @override
  Future<Either<Failure, UserEntiy>> register(
      {required String email, required String password,required String name,})async {
     
   if (await networkInfo.isConnected) {
      try {
        UserEntiy re = await authRemoteDataSource.emailRegister(email: email,password: password,name: name);
        return Right(re);
      } on Exception catch (e) {
        print(e.toString());
        return Left(FirebaseFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  @override
  Future<Either<Failure, UserEntiy>> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
  }

  
  
  

