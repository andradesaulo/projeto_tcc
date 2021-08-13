import 'package:flutter/material.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isPrimary;
  const ElevatedButtonWidget({
    Key? key,
    this.onPressed,
    required this.label,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isPrimary
            ? AppTheme.colors.primary
            : AppTheme.colors.secondary
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label)
      ),
    );
  }
}
