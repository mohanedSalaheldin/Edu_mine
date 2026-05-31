import '../../core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getDarkTheme() => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.scaffoldBackgroundDark,
      colorScheme: ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.primaryDark,
        surface: AppColor.cardBackgroundDark,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColor.textBlack,
        backgroundColor: AppColor.textWhite,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      iconTheme: IconThemeData(
        color: AppColor.textWhite,
      ),

      // *******( Strat TabBarTheme )*******
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.textWhite,
        unselectedLabelColor: AppColor.textGrey,
        indicatorColor: AppColor.primaryDark,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      // *******( End TabBarTheme )*******

      // *******( Strat appBarTheme )*******
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.cardBackgroundDark,
        iconTheme: IconThemeData(
          color: AppColor.textWhite,
        ),
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: AppColor.textWhite,
          fontWeight: FontWeight.w800,
          fontFamily: 'Lateef',
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      // *******( End appBarTheme )*******

      fontFamily: 'Lateef',

      // *******( Strat textTheme )*******
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColor.textWhite,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColor.textWhite,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.textWhite,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.textWhite,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: AppColor.textWhite,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColor.textWhite,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColor.textGrey,
        ),
      ),
      // *******( End textTheme )*******

      // *******( Strat filledButtonTheme )*******
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.textBlack,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      // *******( End filledButtonTheme )*******

      // *******( Strat inputDecorationTheme )*******
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.cardBackgroundDark,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIconColor: AppColor.textWhite,
        suffixIconColor: AppColor.textWhite,
        hintStyle: TextStyle(color: AppColor.textGrey, fontSize: 14),
        labelStyle: TextStyle(color: AppColor.textWhite, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.textWhite.withValues(alpha: 0.1), width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
      // *******( End inputDecorationTheme )*******

      // *******( Start bottomNavigationBarTheme )*******
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.cardBackgroundDark,
        unselectedItemColor: AppColor.textGrey,
        selectedItemColor: AppColor.textWhite,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      // *******( End bottomNavigationBarTheme )*******

      cardTheme: CardThemeData(
        color: AppColor.cardBackgroundDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side:
              BorderSide(color: AppColor.textWhite.withValues(alpha: 0.05), width: 1),
        ),
      ),
    );
