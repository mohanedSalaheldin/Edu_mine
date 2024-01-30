import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/monitors_entity.dart';
import '../repositories/home_repository.dart';

class HomeGetMonitorsUsecase {
  final HomeRepository repository;

  HomeGetMonitorsUsecase({required this.repository});
  Future<Either<Failure, List<MonitorEntity>>>call() {
    return repository.getMonitors();
  }
}
