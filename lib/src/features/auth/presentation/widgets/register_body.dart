import '../cubit/auth_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../config/routes/navigation.dart';
import '../../../../core/utils/methods/app_methods.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../pages/login_screen.dart';
import 'auth_widgets.dart';
import 'package:flutter/material.dart';

SafeArea buildRegisterBody({
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
                      onPressed: () {
                        navigateAndKillTo(
                            context: context, screen: const LoginScreen());
                      },
                    ),
                  ],
                ),
                vericalGab(val: 20.0),
                defaultButton(
                  context: context,
                  content: Text(
                    S.of(context).register,
                  ),
                  onpressed: () async {
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
