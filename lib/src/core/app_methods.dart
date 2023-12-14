import 'package:flutter/material.dart';

bool emailValid(email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);

bool passwordValid(password) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regex.hasMatch(password);
}

ScaffoldFeatureController showError(
    {required BuildContext context, required String txt}) {
  SnackBar snackBar = SnackBar(
    content: Text(
      txt,
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
