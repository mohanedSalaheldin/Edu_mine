import 'package:flutter/material.dart';

TextButton buildTextButtom({
  required void Function()? onPressed,
  required String text,
  required BuildContext context,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
    ),
  );
}

SizedBox vericalGab({double? val}) {
  return SizedBox(
    height: val ?? 10.0,
  );
}

SizedBox horizentalGab({double? val}) {
  return SizedBox(
    width: val ?? 10.0,
  );
}
