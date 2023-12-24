import 'package:e_learning/src/core/utils/network/network_info.dart';
import 'package:e_learning/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_learning/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/register.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/home/data/datasources/home_remote_datasourse.dart';
import 'package:e_learning/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_monitors_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_courses_usecase.dart';
import 'package:e_learning/src/features/home/domain/usecases/home_get_user_data_usecase.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
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
  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));
  // UseCases
  // -------------------------------(Auth)--------------------------------
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  // -------------------------------(Home)--------------------------------
  sl.registerLazySingleton(() => HomeGetUserDataUsecase(repository: sl()));
  sl.registerLazySingleton(() => HomeGetUserCoursesUsecase(repository: sl()));
  sl.registerLazySingleton(() => HomeGetMonitorsUsecase(repository: sl()));

/* --------------------Core-------------------- */
  // -------------------------------(Auth)--------------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  // -------------------------------(Home)--------------------------------
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());

/* --------------------External-------------------- */

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
