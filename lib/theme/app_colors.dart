import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get secondary;
  Color get error;
  Color get inputBackground;
}

class AppColorsDefault extends AppColors {
  @override
  Color get primary => Color(0xff6200EE);

  @override
  Color get inputBackground => Color(0xffEDEDED);

  @override
  Color get secondary => Color(0xff985EFF);

  @override
  Color get error => Color(0xffE03D5A);
}