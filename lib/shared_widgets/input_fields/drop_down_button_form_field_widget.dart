import 'package:flutter/material.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class DropDownButtonFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String?)? onChanged;
  final List<Map<String, String>> menuItems;
  final Function(String?)? onSaved;
  final IconWidget? icon;
  final String? Function(String?)? validator;
  const DropDownButtonFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.menuItems,
    required this.onSaved,
    this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(  
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        items: [
          DropdownMenuItem<String>(
            child: Text(hintText, 
              style: TextStyle(
                color: AppTheme.colors.primary
              )
            ), 
            value: null
          ),
          for (Map<String, String> menuItem in menuItems) 
            DropdownMenuItem<String>(
              child: Text(menuItem["name"]!), 
              value: menuItem["value"],
            ),
        ],
        icon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconWidget(
            name: Icons.arrow_drop_down_circle, 
          ),
        ),
        iconSize: 22,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppTheme.colors.primary,
            fontSize: 14,
          ),
          icon: icon,
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
