import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class TextFieldInputWidget extends StatefulWidget {
  final String label;
  final IconWidget? icon;
  final TextInputType? keyboardType;
  final Function(String, TextEditingController?)? onChanged;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? inputAction;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool hasIcon;

  const TextFieldInputWidget({
    Key? key,
    required this.label,
    this.icon,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.inputAction,
    this.onFieldSubmitted,
    this.validator,
    this.autovalidateMode,
    required this.hasIcon,
  }) : super(key: key);

  @override
  _TextFieldInputWidgetState createState() => _TextFieldInputWidgetState();
}

class _TextFieldInputWidgetState extends State<TextFieldInputWidget> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print("building text input");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved:  widget.onSaved,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.inputAction,
        autovalidateMode: widget.autovalidateMode,
        keyboardType: widget.keyboardType,
        controller: textController,
        onChanged: widget.onChanged == null
        ? (value) {}
        : (value) => widget.onChanged!(value, textController),
        cursorColor: AppTheme.colors.primary,
        decoration: InputDecoration(
          icon: widget.hasIcon? widget.icon : null,
          labelText: widget.label,
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
