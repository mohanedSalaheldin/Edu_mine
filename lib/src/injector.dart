import 'core/utils/network/network_info.dart';
import 'features/allCourses/data/datasources/courses_remote_datasource.dart';
import 'features/allCourses/data/repositories/courses_repository_impl.dart';
import 'features/allCourses/domain/repositories/courses_repository.dart';
import 'features/allCourses/domain/usecases/enroll_in_course_usecase.dart';
import 'features/allCourses/domain/usecases/get_all_courses_usecase.dart';
import 'features/allCourses/domain/usecases/is_inrolled_in_the_course_usecase.dart';
import 'features/allCourses/presentation/cubit/allcourses_cubit.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/login_with_google_usecase.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/data/datasources/my_courses_remote_datasourse.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/home_get_monitors_usecase.dart';
import 'features/home/domain/usecases/home_get_user_courses_usecase.dart';
import 'features/home/domain/usecases/home_get_user_data_usecase.dart';
import 'features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'features/myCourses/data/datasources/my_course_remote_datasourse.dart';
import 'features/myCourses/data/repositories/my_courses_repository_impl.dart';
import 'features/myCourses/domain/repositories/my_courses_repository.dart';
import 'features/myCourses/domain/usecases/get_all_sections_usecase.dart';
import 'features/myCourses/domain/usecases/my_courses_get_user_courses_usecase.dart';
import 'features/myCourses/domain/usecases/set_section_as_watched_usecase.dart';
import 'features/myCourses/presentation/cubit/mycourses_cubit.dart';
import 'features/settings/data/datasources/settings_local_datasource.dart';
import 'features/settings/data/datasources/settings_remote_datasource.dart';
import 'features/settings/data/repositories/settings_reposiory_impl.dart';
import 'features/settings/domain/repositories/settings_repository.dart';
import 'features/settings/domain/usecases/cache_lang_usecase.dart';
import 'features/settings/domain/usecases/cache_theme_usecase.dart';
import 'features/settings/domain/usecases/get_cached_lang_usecase.dart';
import 'features/settings/domain/usecases/get_cached_theme_usecase.dart';
import 'features/settings/domain/usecases/get_user_data_usecase.dart';
import 'features/settings/domain/usecases/logout_usecase.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';
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
      setSectionAsWatchedUseCase: sl(),
      getAllSectionsUsecase: sl(),
      myCoursesGetUserCoursesUsecase: sl()));
  sl.registerFactory(() => SettingsCubit(
        cacheAppLangUsecase: sl(),
        cacheAppThemeUsecase: sl(),
        getCachedLangUsecase: sl(),
        getCachedThemeUsecase: sl(),
        getUserDataUsecase: sl(),
        logOutUsecase: sl(),
      ));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImpl(dataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<MyCoursesRepository>(
      () => MyCoursesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(
        localDataSource: sl(),
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
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
  sl.registerLazySingleton(() => SetSectionAsWatchedUseCase(repository: sl()));
  // -------------------------------(Settings)--------------------------------
  sl.registerLazySingleton(() => CacheAppLangUsecase(repository: sl()));
  sl.registerLazySingleton(() => CacheAppThemeUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCachedLangUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCachedThemeUsecase(repository: sl()));
  sl.registerLazySingleton(() => LogOutUsecase(repository: sl()));
  sl.registerLazySingleton(() => SettingsGetUserDataUsecase(repository: sl()));

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
  // -------------------------------(My Courses)--------------------------------
  sl.registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl());
  sl.registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl());
/* --------------------External-------------------- */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
