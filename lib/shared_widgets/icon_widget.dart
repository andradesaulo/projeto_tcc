import 'package:flutter/material.dart';

import 'package:projeto_tcc/theme/app_theme.dart';

class IconWidget extends StatelessWidget {
  final IconData name;
  final double? size;
  final Color? color;
  const IconWidget({
    Key? key,
    required this.name,
    this.size,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      name,
      color: color ?? AppTheme.colors.primary,
      size: size,
    );
  }
}
