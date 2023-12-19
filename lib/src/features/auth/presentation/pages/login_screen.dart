import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/app_methods.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:e_learning/src/features/auth/presentation/pages/register_screen.dart';
import 'package:e_learning/src/features/auth/presentation/widgets/auth_widgets.dart';
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
          // if (state is AuthGoogleLoginSuccess || state is AuthEmailLoginSuccess ) {
          //   Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomeTestScreen(),
          //         ));
          // }
          if (state is AuthGoogleLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              _showErrorSnackBar(context, S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              _showErrorSnackBar(context, S.of(context).serverError);
            }
          }
          if (state is AuthEmailLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              _showErrorSnackBar(context, S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              _showErrorSnackBar(context, S.of(context).serverError);
            } else {
              _showErrorSnackBar(context, S.of(context).invaild_credential);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String txt) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        txt,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    S.of(context).welcome,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  vericalGab(),
                  Text(
                    S.of(context).sign_in_to_continue,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  vericalGab(val: 50.0),
                  defaultTextFormField(
                    context: context,
                    icon: Icons.email_outlined,
                    hint: S.of(context).email,
                    validator: (value) {
                      if (value == '' || !emailValid(value)) {
                        return S.of(context).invaild_email;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  vericalGab(),
                  defaultTextFormField(
                    ispassword: true,
                    context: context,
                    icon: Icons.lock_outline,
                    hint: S.of(context).password,
                    validator: (value) {
                      if (value != null) {
                        if (value.length < 8) {
                          return S.of(context).invaild_password;
                        }
                      } else {
                        return ' ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                  ),
                  vericalGab(val: 20.0),
                  Center(
                    child: buildTextButtom(
                      text: S.of(context).forgot_password,
                      context: context,
                      onPressed: () {},
                    ),
                  ),
                  vericalGab(val: 20.0),
                  InkWell(
                    onTap: () {
                      AuthCubit.get(context).loginWithGoogle();
                    },
                    child: const Center(
                      child: Image(
                        height: 60.0,
                        image: AssetImage(
                          'assets/images/googleLight.png',
                        ),
                      ),
                    ),
                  ),
                  vericalGab(val: 20.0),
                  // const Spacer(),
                  // const Expanded(child: Text('')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).create_new_account,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 17,
                            ),
                      ),
                      buildTextButtom(
                        text: S.of(context).register,
                        context: context,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const RegisterScreen()),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  vericalGab(val: 20.0),
                  defaultButton(
                    context: context,
                    content: Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthCubit.get(context).loginWithEmail(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }

                      // formKey.currentState!.validate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
