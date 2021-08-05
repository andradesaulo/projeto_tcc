import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get primaryOpaque;
  Color get inputBackground;
}

class AppColorsDefault extends AppColors {
  @override
  Color get primary => Color(0xff6200EE);

  @override
  Color get inputBackground => Color(0xffEDEDED);

  @override
  Color get primaryOpaque => Color(0xffB080F7);
}