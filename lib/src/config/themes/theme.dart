import 'package:flutter/material.dart';

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
    // appBarTheme: AppBarTheme(
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: HexColor('#5D13E7'),
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // ),
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
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
  );
}
