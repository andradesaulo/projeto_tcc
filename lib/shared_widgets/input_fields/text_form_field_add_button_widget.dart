import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class TextFormFieldInputAddButtonWidget extends StatefulWidget {
  final String label;
  final String? hint;
  final String? helperText;
  final IconWidget? icon;
  final TextInputType? keyboardType;
  final Function(String, TextEditingController)? onChanged;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? inputAction;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool hasIcon;
  final Function(TextEditingController) onAdd;
  const TextFormFieldInputAddButtonWidget({
    Key? key,
    required this.label,
    this.hint,
    this.helperText,
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
    required this.onAdd,
  }) : super(key: key);

  @override
  _TextFormFieldInputAddButtonWidgetState createState() => _TextFormFieldInputAddButtonWidgetState();
}

class _TextFormFieldInputAddButtonWidgetState extends State<TextFormFieldInputAddButtonWidget> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print("building text input");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved:  widget.onSaved,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.inputAction ?? TextInputAction.next,
        keyboardType: widget.keyboardType,
        controller: textController,
        onChanged: widget.onChanged == null
        ? (value) {}
        : (value) => widget.onChanged!(value, textController),
        cursorColor: AppTheme.colors.primary,
        decoration: InputDecoration(
          icon: widget.hasIcon? widget.icon : null,
          suffixIcon: GestureDetector(
            child: IconWidget(name: Icons.add_circle_outline),
            onTap: () => widget.onAdd(textController)
          ),
          labelText: widget.label,
          helperText: widget.helperText,
          helperStyle: TextStyle(
            color: AppTheme.colors.primary
          ),
          hintText: widget.hint,
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
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.error,
              width: 2
            )
          )
        ),
      ),
    );
  }
}
