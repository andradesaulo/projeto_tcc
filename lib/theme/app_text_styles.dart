import 'package:flutter/material.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get titleInfoPet;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get titleInfoPet => TextStyle(
    color: AppTheme.colors.primary,
    fontSize: 16,
  );
}
