import 'package:flutter/material.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/drop_down_button_form_field_widget.dart';

class PetTipoFormFieldWidget extends StatelessWidget {
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  const PetTipoFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownButtonFormFieldWidget(
      hintText: "Tipo do animal", 
      validator: (value) => 
        value == null 
        ? "Insira o tipo do animal"
        : null,
      menuItems: [
        {"name": "Gato", "value": "g"},
        {"name": "Cachorro", "value": "c"},
      ], 
      icon: IconWidget(
        name: Icons.help,
      ),
      onChanged: onChanged, 
      onSaved: onSaved);
  }
}
