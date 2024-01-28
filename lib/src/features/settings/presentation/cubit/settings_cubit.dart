import 'package:e_learning/src/config/themes/theme.dart';
import 'package:e_learning/src/core/utils/consts/constatnts.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';



class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);

  ThemeData appTheme = AppTheme.darkTheme;
  void changeAppTheme() {
    if (appTheme == AppTheme.darkTheme) {
      appTheme = AppTheme.lightTheme;
    } else {
      appTheme = AppTheme.darkTheme;
    }
    isAppThemeIsDark = appTheme == AppTheme.darkTheme;
    emit(SettingsChangeThemeState());
  }

  // ThemeData getCurrentTheme() {
  //   ThemeData themeData = _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  //   emit(SettingsGetCurrentThemeState());
  //   return themeData;
  // }

  String appLang = 'en';
  void changeAppLang() {
    if (appLang == 'en') {
      appLang = 'ar';
    } else {
      appLang = 'en';
    }
    emit(SettingsChangeLangState());
  }

  // String getCurrentLang() {
  //   String lang = _isEnglish ? 'en' : 'ar';
  //   emit(SettingsGetCurrentLangState());
  //   return lang;
  // }
}

bool isAppThemeIsDark = true;
bool isAppLangEnglish = true;
