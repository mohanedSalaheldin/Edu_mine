import 'package:dartz/dartz.dart';
import '../../../../config/themes/theme.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/consts/constatnts.dart';
import '../../domain/usecases/cache_lang_usecase.dart';
import '../../domain/usecases/cache_theme_usecase.dart';
import '../../domain/usecases/get_cached_lang_usecase.dart';
import '../../domain/usecases/get_cached_theme_usecase.dart';
import '../../domain/usecases/get_user_data_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required this.getCachedLangUsecase,
    required this.getCachedThemeUsecase,
    required this.getUserDataUsecase,
    required this.logOutUsecase,
    required this.cacheAppLangUsecase,
    required this.cacheAppThemeUsecase,
  }) : super(SettingsInitial());

  final GetCachedLangUsecase getCachedLangUsecase;
  final GetCachedThemeUsecase getCachedThemeUsecase;
  final SettingsGetUserDataUsecase getUserDataUsecase;
  final LogOutUsecase logOutUsecase;
  final CacheAppLangUsecase cacheAppLangUsecase;
  final CacheAppThemeUsecase cacheAppThemeUsecase;

  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);

  ThemeData appTheme = AppTheme.darkTheme;
  void getThemeFromCache() async {
    Either<Failure, String> response = await getCachedThemeUsecase.call();
    response.fold(
      (failure) {},
      (cachedThemeName) {
        if (cachedThemeName == darkThemeCode) {
          appTheme = AppTheme.darkTheme;
        } else if (cachedThemeName == lightThemeCode) {
          appTheme = AppTheme.lightTheme;
        }
        isAppThemeIsDark = appTheme == AppTheme.darkTheme;
        emit(SettingsGetThemeFromCacheSuccessState());
      },
    );
  }

  void changeAppTheme() async {
    if (appTheme == AppTheme.darkTheme) {
      appTheme = AppTheme.lightTheme;
    } else {
      appTheme = AppTheme.darkTheme;
    }
    isAppThemeIsDark = appTheme == AppTheme.darkTheme;
    String themeName = isAppThemeIsDark ? darkThemeCode : lightThemeCode;
    await cacheAppThemeUsecase.call(themeName: themeName);
    emit(SettingsChangeThemeState());
  }

  String appLang = englishLangCode;
  void getLangFromCache() async {
    Either<Failure, String> response = await getCachedLangUsecase.call();
    response.fold(
      (failure) {},
      (cachedLangName) async {
        if (cachedLangName == arabicLangCode) {
          appLang = arabicLangCode;
        } else if (cachedLangName == englishLangCode) {
          appLang = englishLangCode;
        }
        emit(SettingsGetLangFromCacheSuccessState());
      },
    );
  }

  void changeAppLang() async {
    if (appLang == englishLangCode) {
      appLang = arabicLangCode;
    } else {
      appLang = englishLangCode;
    }
    emit(SettingsChangeLangState());
    await cacheAppLangUsecase.call(langCode: appLang);
  }

  void logout() async {
    emit(SettingsUserLogoutLoadingState());
    Either<Failure, Unit> response = await logOutUsecase.call();
    response.fold(
      (failure) {
        emit(SettingsUserLogoutErrorState());
      },
      (_) {
        emit(SettingsUserLogoutSuccessState());
      },
    );
  }

  Map<String, dynamic> userData = {};
  void getUserData() async {
    emit(SettingsGetUserDataLoadingState());
    Either<Failure, Map<String, dynamic>> response =
        await getUserDataUsecase.call();

    response.fold(
      (failure) {
        emit(SettingsGetUserDataErrorState());
      },
      (userDataMap) async {
        userData = userDataMap;
        emit(SettingsGetUserDataSuccessState());
      },
    );
  }
}

bool isAppThemeIsDark = true;
bool isAppLangEnglish = true;
