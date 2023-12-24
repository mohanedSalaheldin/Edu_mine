import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';

class HomeGetMonitorsUsecase {
  final HomeRepository repository;

  HomeGetMonitorsUsecase({required this.repository});
  Future<Either<Failure, List<MonitorEntity>>>call() {
    return repository.getMonitors();
  }
}
