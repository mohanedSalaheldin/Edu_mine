import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/config/routes/navigation.dart';
import 'package:e_learning/src/core/utils/methods/app_methods.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:e_learning/src/features/auth/presentation/pages/register_screen.dart';
import 'package:e_learning/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:e_learning/src/features/auth/presentation/widgets/login_body.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/src/injector.dart' as di;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthGoogleLoginSuccess ||
              state is AuthEmailLoginSuccess) {
            navigateAndKillTo(
                context: context, screen: const HomeLayoutScreen());
          }
          if (state is AuthGoogleLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).serverError);
            }
          }
          if (state is AuthEmailLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).serverError);
            } else {
              showErrorSnackBar(
                  context: context, txt: S.of(context).invaild_credential);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: buildLoginBody(context),
          );
        },
      ),
    );
  }

}
