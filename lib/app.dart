import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/config/themes/theme.dart';
import 'package:e_learning/src/features/auth/presentation/pages/login_screen.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_layout.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_learning/src/injector.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<SettingsCubit>(),
        ),
      ],
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // var value = SettingsCubit.get(context).getCurrentLang();
          // var theme = SettingsCubit.get(context).getCurrentTheme();

          return MaterialApp(
            locale: Locale(SettingsCubit.get(context).appLang),
            theme: SettingsCubit.get(context).appTheme,
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
        },
      ),
    );
  }

  Widget _choseStartScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const LoginScreen();
    } else {
      return const HomeLayoutScreen();
    }
  }
}
