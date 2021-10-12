import 'package:flutter/material.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class AppListTileColors {
  static final List<Color> colors = [
    AppTheme.colors.tertiaryOpaque,
    AppTheme.colors.quaternaryOpaque,
    AppTheme.colors.quinaryOpaque,
  ];

  static Color getColor(int i) {
    return colors[i % 3];
  }
}
