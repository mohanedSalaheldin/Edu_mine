import 'package:flutter/material.dart';

void navigateAndKillTo(
    {required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void navigateTo({required BuildContext context, required Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
