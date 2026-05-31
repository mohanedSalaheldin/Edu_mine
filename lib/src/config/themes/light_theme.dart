import '../../core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightTheme() => ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.scaffoldBackground,
      colorScheme: ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.primaryDark,
        surface: AppColor.cardBackground,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColor.textWhite,
        backgroundColor: AppColor.textBlack,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      iconTheme: IconThemeData(
        color: AppColor.textBlack,
      ),

      // *******( Start TabBarTheme )******
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.textBlack,
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
      // *******( End TabBarTheme )******

      // *******( Start AppBarTheme )******
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.scaffoldBackground,
        iconTheme: IconThemeData(
          color: AppColor.textBlack,
        ),
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: AppColor.textBlack,
          fontWeight: FontWeight.w800,
          fontFamily: 'Lateef',
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      // *******( End AppBarTheme )******

      // *******( Start inputDecorationTheme )******
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIconColor: AppColor.textBlack,
        suffixIconColor: AppColor.textBlack,
        hintStyle: TextStyle(color: AppColor.textGrey, fontSize: 14),
        labelStyle: TextStyle(color: AppColor.textBlack, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.textBlack, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.textBlack.withValues(alpha: 0.1), width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      // *******( End inputDecorationTheme )******

      fontFamily: 'Lateef',

      // *******( Start TextTheme )*******
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColor.textBlack,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColor.textBlack,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.textBlack,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.textBlack,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: AppColor.textBlack,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColor.textBlack,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColor.textGrey,
        ),
      ),
      // *******( End TextTheme )*******

      // *******( Start filledButtonTheme )*******
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

      // *******( Start bottomNavigationBarTheme )*******
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: AppColor.textGrey,
        selectedItemColor: AppColor.textBlack,
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
        color: AppColor.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColor.textBlack.withValues(alpha: 0.05), width: 1),
        ),
      ),
    );

