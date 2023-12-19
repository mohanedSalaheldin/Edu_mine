import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Text(
          'Settings',
        ),
      ),
    );
  }
}
