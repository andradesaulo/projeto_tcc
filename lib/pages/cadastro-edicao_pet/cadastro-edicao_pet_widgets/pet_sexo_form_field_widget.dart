import 'package:flutter/material.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/drop_down_button_form_field_widget.dart';

class PetSexoFormFieldWidget extends StatelessWidget {
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? initialValue;
  const PetSexoFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownButtonFormFieldWidget(
      hintText: "Sexo",
      initialValue: initialValue,
      validator: (value) => 
        value == null 
        ? "Insira o sexo do animal"
        : null,
      menuItems:[
        {"name": "Fêmea", "value": "f"},
        {"name": "Macho", "value": "m"},
        {"name": "Não definido", "value": "n"}, 
      ],
      icon: IconWidget(
        name: Icons.wc
      ),
      onChanged: onChanged ?? (value) {},
      onSaved: onSaved,
    );
  }
}
