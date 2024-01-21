import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/home/domain/entities/home_user_entity.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeUserEntity>> getUserData({required String uID});
  Future<Either<Failure, List<CourseEntity>>> getUserCourses({required String uID});
  Future<Either<Failure, List<MonitorEntity>>> getMonitors();
}
