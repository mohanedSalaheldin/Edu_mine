import 'package:flutter/material.dart';

class ScreenSizes {
  static double getHieght(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
