import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class PetIdadeFormFieldWidget extends StatelessWidget {
  final Function(String, TextEditingController?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(int?) onSaved;
  final TextInputAction? inputAction;
  final String? initialValue;
  const PetIdadeFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.onSaved,
    this.inputAction, this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldInputWidget(
      label: "Idade (anos)", 
      initialValue: initialValue,
      hasIcon: true, 
      icon: IconWidget(name: Icons.cake),
      keyboardType: TextInputType.number,
      inputAction: inputAction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        LengthLimitingTextInputFormatter(2)
      ],
      onChanged: onChanged ?? (idade, controller) {},
      validator: (idade) {
        if (idade!.isNotEmpty) {
          int idadeInt = int.tryParse(idade) ?? 0;
          if (idadeInt == 0) {
            return "Idade inválida";
          } else if (idadeInt > 30) {
            return "Insira uma idade menor que 30 anos";
          }
        }
      },
      onSaved: (petIdade) {
        try {
          onSaved(DateTime.now().year - int.parse(petIdade!));
        } on Exception {
          onSaved(null);
        }
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
