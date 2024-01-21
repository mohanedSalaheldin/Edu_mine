import 'package:e_learning/src/core/utils/network/network_info.dart';
import 'package:e_learning/src/features/allCourses/data/datasources/courses_remote_datasource.dart';
import 'package:e_learning/src/features/allCourses/data/repositories/courses_repository_impl.dart';
import 'package:e_learning/src/features/allCourses/domain/repositories/courses_repository.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/enroll_in_course_usecase.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/get_all_courses_usecase.dart';
import 'package:e_learning/src/features/allCourses/domain/usecases/is_inrolled_in_the_course_usecase.dart';
import 'package:e_learning/src/features/allCourses/presentation/cubit/allcourses_cubit.dart';
import 'package:e_learning/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_learning/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/register.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/home/data/datasources/my_courses_remote_datasourse.dart';
import 'package:e_learning/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_monitors_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_courses_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_data_usecase.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:e_learning/src/features/myCourses/data/datasources/home_remote_datasourse.dart';
import 'package:e_learning/src/features/myCourses/data/repositories/my_courses_repository_impl.dart';
import 'package:e_learning/src/features/myCourses/domain/repositories/my_courses_repository.dart';
import 'package:e_learning/src/features/myCourses/domain/usecases/get_all_sections_usecase.dart';
import 'package:e_learning/src/features/myCourses/domain/usecases/my_courses_get_user_courses_usecase.dart';
import 'package:e_learning/src/features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
/* --------------------Features-------------------- */
// Quates
  // Bloc
  sl.registerFactory(() => AuthCubit(
      loginUseCase: sl(), loginWithGoogleUseCase: sl(), registerUseCase: sl()));
  sl.registerFactory(() => HomeScreenCubit(
      getUserDataUsecase: sl(),
      getUserCoursesUsecase: sl(),
      getMonitorsUsecase: sl()));
  sl.registerFactory(() => AllcoursesCubit(
      getAllCoursesUseCase: sl(),
      enrollInCourseUseCase: sl(),
      isEnrolledInCourseUseCase: sl()));
  sl.registerFactory(() => MycoursesCubit(
      getAllSectionsUsecase: sl(), myCoursesGetUserCoursesUsecase: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<MyCoursesRepository>(
      () => MyCoursesRepositoryImpl(remoteDataSource: sl()));
  // UseCases
  // -------------------------------(Auth)--------------------------------
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  // -------------------------------(Home)--------------------------------
  sl.registerLazySingleton(() => HomeGetUserDataUsecase(repository: sl()));
  sl.registerLazySingleton(() => HomeGetUserCoursesUsecase(repository: sl()));
  sl.registerLazySingleton(() => HomeGetMonitorsUsecase(repository: sl()));
  // -------------------------------(All Courses)--------------------------------
  sl.registerLazySingleton(() => GetAllCoursesUseCase(repository: sl()));
  sl.registerLazySingleton(() => EnrollInCourseUseCase(repository: sl()));
  sl.registerLazySingleton(() => IsEnrolledInCourseUseCase(repository: sl()));
  // -------------------------------(My Courses)--------------------------------
  sl.registerLazySingleton(
      () => MyCoursesGetUserCoursesUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAllSectionsUsecase(repository: sl()));

/* --------------------Core-------------------- */
  // -------------------------------(Auth)--------------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  // -------------------------------(Home)--------------------------------
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
  // -------------------------------(All Courses)--------------------------------
  sl.registerLazySingleton<CoursesRemoteDataSource>(
      () => CoursesRemoteDataSourceImpl());
  // -------------------------------(My Courses)--------------------------------
  sl.registerLazySingleton<MyCoursesRemoteDataSource>(
      () => MyCoursesRemoteDataSourceImpl());

/* --------------------External-------------------- */

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
