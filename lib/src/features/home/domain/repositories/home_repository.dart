import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/home_user_entity.dart';
import '../entities/monitors_entity.dart';
import '../../../../core/entities/my_courses_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeUserEntity>> getUserData({required String uID});
  Future<Either<Failure, List<CourseEntity>>> getUserCourses({required String uID});
  Future<Either<Failure, List<MonitorEntity>>> getMonitors();
}
