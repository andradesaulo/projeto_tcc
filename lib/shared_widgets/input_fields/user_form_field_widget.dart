import 'package:flutter/material.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class UserFormFieldWidget extends StatelessWidget {
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String, TextEditingController?)? onChanged;
  final bool hasIcon;
  final TextInputAction? inputAction;
  const UserFormFieldWidget({
    Key? key,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.hasIcon = false,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldInputWidget(
      validator: (username) =>
        username!.isEmpty ? "Insira um nome de usuário" : null,
      label: "Usuário",
      keyboardType: TextInputType.name,
      inputAction: inputAction,
      icon: IconWidget(name: Icons.person),
      hasIcon: hasIcon,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
