import '../../../../../generated/l10n.dart';
import '../../../../config/routes/navigation.dart';
import '../../../../core/utils/methods/app_methods.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../cubit/auth_cubit.dart';
import '../pages/register_screen.dart';
import 'auth_widgets.dart';
import 'package:flutter/material.dart';

Widget buildLoginBody(
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
                Text(S.of(context).welcome,
                    style: Theme.of(context).textTheme.bodyLarge),
                vericalGab(),
                Text(S.of(context).sign_in_to_continue,
                    style: Theme.of(context).textTheme.bodySmall),
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
                        image: AssetImage('assets/images/googleLight.png')),
                  ),
                ),
                vericalGab(val: 20.0),
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
                        navigateAndKillTo(
                            context: context, screen: const RegisterScreen());
                      },
                    ),
                  ],
                ),
                vericalGab(val: 20.0),
                defaultButton(
                  context: context,
                  content: Text(
                    S.of(context).login,
                  ),
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthCubit.get(context).loginWithEmail(
                          email: emailController.text,
                          password: passwordController.text);
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
