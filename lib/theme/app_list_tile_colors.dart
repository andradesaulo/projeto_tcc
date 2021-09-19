import 'package:flutter/material.dart';

class AppListTileColors {
  static final List<Color> colors = [
    Color(0xffFAE4B3),
    Color(0xffC1F4AC),
    Color(0xffC9EDEB),
  ];

  static Color getColor(int i) {
    return colors[i % 3];
  }
}
