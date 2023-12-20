import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/home/domain/entities/home_user_entity.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';

class HomeGetUserDataUsecase {
  final HomeRepository repository;

  HomeGetUserDataUsecase({required this.repository});
  Future<Either<Failure, HomeUserEntity>> call({required String uID}) {
    return repository.getUserData(uID: uID);
  }
}
