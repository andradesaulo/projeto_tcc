import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class PetAlturaFormFieldWidget extends StatelessWidget {
  final Function(String, TextEditingController?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(int?) onSaved;
  final TextInputAction? inputAction;
  const PetAlturaFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.onSaved,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldInputWidget(
      label: "Altura (cm)", 
      hasIcon: true, 
      icon: IconWidget(name: Icons.height),
      keyboardType: TextInputType.number,
      inputAction: inputAction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')), LengthLimitingTextInputFormatter(3)
      ],
      onChanged: onChanged ?? (altura, controller) {},
      validator: (altura) {
        if (altura!.isNotEmpty) {
          int alturaInt = int.tryParse(altura) ?? 0;
          if (alturaInt == 0) {
            return "Altura inválida";
          } else if (alturaInt > 300) {
            return "Insira uma altura menor que 300cm";
          } 
        }
      },
      onSaved: (petAltura) {
        onSaved(int.tryParse(petAltura!));
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
