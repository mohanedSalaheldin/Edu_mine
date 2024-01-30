import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData getDarkTheme() => ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: HexColor('#191b1c'),
      // *******( End textTheme )*******

      // *******( Strat TabBarTheme )*******
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        indicatorColor: HexColor('#8eb93a'),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: HexColor('#bbe362'),
            width: 4,
          ),
        ),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
          // fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      // *******( End TabBarTheme )*******

      // *******( Strat appBarTheme )*******
      appBarTheme: AppBarTheme(
        // color: Colors.white,
        color: HexColor('#252727'),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      // *******( End appBarTheme )*******
      fontFamily: 'Inter',
      primarySwatch: mainAppColorLight,
      // *******( Strat textTheme )*******
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 47,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // *******( End textTheme )*******

      // *******( Strat filledButtonTheme )*******
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(HexColor('#c0e863')),
        ),
      ),
      // *******( End filledButtonTheme )*******
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      // *******( Strat inputDecorationTheme )*******
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(20.0),
        prefixIconColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        suffixIconColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: .5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: .5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      // *******( End inputDecorationTheme )*******

      // *******( Start bottomNavigationBarTheme )*******

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        backgroundColor: HexColor('#252727'),
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      // *******( End bottomNavigationBarTheme )*******
    );
