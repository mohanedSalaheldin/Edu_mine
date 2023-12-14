import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/core/errors/error_strings.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:e_learning/src/features/auth/presentation/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/src/injector.dart' as di;

class HomeTestScreen extends StatelessWidget {
  const HomeTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    User user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Text(
          user.email!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        FilledButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            });
          },
          child: const Text('log out'),
        ),
      ],
    ));
  }
}
