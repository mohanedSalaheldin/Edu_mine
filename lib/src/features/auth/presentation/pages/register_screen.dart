import '../../../../../generated/l10n.dart';
import '../../../../core/utils/methods/app_methods.dart';
import '../../../../core/errors/error_strings.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injector.dart' as di;

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthGoogleLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              showErrorSnackBar(
                  context: context, txt: S.of(context).serverError);
            }
          }
          if (state is AuthEmailRegisterError) {
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
        builder: (context, state) => Scaffold(
          body: buildRegisterBody(
            context: context,
          ),
        ),
      ),
    );
  }
}
