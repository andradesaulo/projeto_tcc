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
    return Container(
      width: 150,
      height: 40,
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ButtonStyle(
            // side: isPrimary ? null : MaterialStateProperty.all(BorderSide(
            //   color: AppTheme.colors.tertiary,
            //   width: 2
            // )),
            backgroundColor: MaterialStateProperty.all<Color>(
              isPrimary
              ? AppTheme.colors.elevatedBtnPrimary
              : AppTheme.colors.elevatedBtnSecondary
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation:  MaterialStateProperty.all<double>(4),
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label, style: TextStyle(color: isPrimary ? AppTheme.colors.elevatedBtnTextPrimary : AppTheme.colors.elevatedBtnTextSecondary),)
        ),
      ),
    );
  }
}
