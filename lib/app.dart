import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/config/themes/theme.dart';
import 'package:e_learning/src/features/auth/presentation/pages/home_test.dart';
import 'package:e_learning/src/features/auth/presentation/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'E-Learning',
      debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),
      home: _choseStartScreen(),
    );
  }
  Widget _choseStartScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const LoginScreen();
    } else {
      return const HomeTestScreen();
    }
  }
}
