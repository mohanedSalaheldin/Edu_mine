import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static MaterialColor mainAppColor = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: HexColor('#f6f7f7'),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        indicatorColor: HexColor('#8eb93a'),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: HexColor('#bbe362'),
            width: 4,
          ),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          // fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      fontFamily: 'Inter',
      primarySwatch: mainAppColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 47,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ));
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
  );
}
