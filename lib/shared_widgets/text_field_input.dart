import 'package:flutter/material.dart';

import 'package:projeto_tcc/theme/app_theme.dart';

class TextFieldInputWidget extends StatelessWidget {
  final String label;
  final Icon? icon;
  final Function(String value)? onChanged;
  const TextFieldInputWidget({
    Key? key,
    required this.label,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: (value) => onChanged!(value),
        cursorColor: AppTheme.colors.primary,
        decoration: InputDecoration(
          icon: icon,
          labelText: label,
          labelStyle: TextStyle(
            color: AppTheme.colors.primary,
            fontSize: 14,
          ),
          fillColor: AppTheme.colors.inputBackground,
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.primary,
              width: 2,
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.primary,
              width: 2,
            )
          ),
        ),
      ),
    );
  }
}
