import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/utils/methods/app_methods.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:e_learning/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/src/injector.dart' as di;

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is AuthGoogleLoginSuccess ||
          //     state is AuthEmailRegisterSuccess) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const HomeTestScreen(),
          //       ));
          // }

          if (state is AuthGoogleLoginError) {
            if (state.msg == ErrorsString.noInternet) {
              _showErrorSnackBar(context, S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              _showErrorSnackBar(context, S.of(context).serverError);
            }
          }
          if (state is AuthEmailRegisterError) {
            if (state.msg == ErrorsString.noInternet) {
              _showErrorSnackBar(context, S.of(context).no_nternet);
            } else if (state.msg == ErrorsString.serverError) {
              _showErrorSnackBar(context, S.of(context).serverError);
            } else {
              _showErrorSnackBar(context, S.of(context).invaild_credential);
            }
          }
        },
        builder: (context, state) => Scaffold(
          body: _buildBody(
            context: context,
          ),
        ),
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

  SafeArea _buildBody({
    required BuildContext context,
  }) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final rePasswordController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).welcome,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  vericalGab(),
                  Text(
                    S.of(context).sign_up_to_join,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  vericalGab(val: 30.0),
                  defaultTextFormField(
                    context: context,
                    icon: Icons.person_2_outlined,
                    hint: S.of(context).name,
                    validator: (p0) {
                      if (p0 == null || p0 == '') {
                        return S.of(context).invaild_name_short;
                      } else if (p0.length > 16) {
                        return S.of(context).invaild_name_long;
                      } else if (p0.length < 2) {
                        return S.of(context).invaild_name_short;
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    controller: nameController,
                  ),
                  vericalGab(),
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
                      context: context,
                      icon: Icons.lock_outline,
                      hint: S.of(context).password,
                      ispassword: true,
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
                      controller: passwordController),
                  vericalGab(),
                  defaultTextFormField(
                    context: context,
                    ispassword: true,
                    icon: Icons.lock_outline,
                    hint: S.of(context).password_again,
                    validator: (value) {
                      if (value != null) {
                        if (value.length < 8) {
                          return S.of(context).invaild_password;
                        } else {
                          if (passwordController.text != value) {
                            return S.of(context).invaild_password;
                          }
                        }
                      } else {
                        return ' ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: rePasswordController,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).have_an_account,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 17,
                            ),
                      ),
                      buildTextButtom(
                        text: S.of(context).login,
                        context: context,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  vericalGab(val: 20.0),
                  defaultButton(
                    context: context,
                    content: Text(
                      S.of(context).register,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    onpressed: () async {
                      // await FirebaseAuth.instance.signOut().then((value) {});
                      if (formKey.currentState!.validate()) {
                        AuthCubit.get(context).registerWithEmail(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
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

  bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
