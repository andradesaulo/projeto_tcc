import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class PetNomeFormFieldWidget extends StatelessWidget {
  final Function(String, TextEditingController?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(String?) onSaved;
  final TextInputAction? inputAction;
  final String? initialValue;
  const PetNomeFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.onSaved,
    this.inputAction, this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldInputWidget(
      label: "Nome",
      initialValue: initialValue,
      hasIcon: true,
      icon: IconWidget(name: Icons.loyalty),
      inputAction: inputAction,
      inputFormatters: [LengthLimitingTextInputFormatter(60)],
      onChanged: onChanged ?? (nome, controller) {},
      validator: (petName) => 
        petName!.trim().isEmpty ? "Insira o nome do seu pet" : null,
      onSaved: (petNome) {
        onSaved(petNome!.trim());
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
