import 'package:e_learning/src/core/utils/network/network_info.dart';
import 'package:e_learning/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_learning/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_learning/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:e_learning/src/features/auth/domain/usecases/register.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
/* --------------------Features-------------------- */
// Quates
  // Bloc
  sl.registerFactory(() => AuthCubit(loginUseCase: sl(), loginWithGoogleUseCase: sl(), registerUseCase: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));
  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));

/* --------------------Core-------------------- */
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

/* --------------------External-------------------- */

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
