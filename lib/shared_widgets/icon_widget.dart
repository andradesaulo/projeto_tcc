import 'package:flutter/material.dart';

import 'package:projeto_tcc/theme/app_theme.dart';

class IconWidget extends StatelessWidget {
  final IconData name;
  final double? size;
  const IconWidget({
    Key? key,
    required this.name,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      name,
      color: AppTheme.colors.primary,
      size: size,
    );
  }
}
