import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).welcome,
                style: const TextStyle(
                  fontSize: 47,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vericalGab(),
              Text(
                S.of(context).sign_in_to_continue,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              vericalGab(val: 50.0),
              defaultTextFormField(
                icon: Icons.email_outlined,
                hint: 'Email',
                validator: (p0) {
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: emailController,
              ),
              vericalGab(),
              defaultTextFormField(
                icon: Icons.lock_outline,
                hint: 'Password',
                validator: (p0) {
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: passwordController,
              ),
              vericalGab(val: 30.0),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).forgot_password,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              vericalGab(val: 20.0),
              InkWell(
                onTap: () {},
                child: const Center(
                  child: Image(
                    height: 60.0,
                    image: AssetImage(
                      'assets/images/googleLight.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox vericalGab({double? val}) {
    return SizedBox(
      height: val ?? 10.0,
    );
  }

  Widget defaultTextFormField({
    required String hint,
    required String? Function(String?)? validator,
    required TextInputType keyboardType,
    required controller,
    required IconData icon,
    bool ispassword = false,
  }) =>
      TextFormField(
        validator: validator,
        controller: controller,
        obscureText: ispassword,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.all(20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          // hintText: hint,
          label: Text(hint),
          hintStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
