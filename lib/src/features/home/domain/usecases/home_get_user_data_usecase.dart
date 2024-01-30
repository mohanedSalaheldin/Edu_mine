import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/home_user_entity.dart';
import '../repositories/home_repository.dart';

class HomeGetUserDataUsecase {
  final HomeRepository repository;

  HomeGetUserDataUsecase({required this.repository});
  Future<Either<Failure, HomeUserEntity>> call({required String uID}) {
    return repository.getUserData(uID: uID);
  }
}
