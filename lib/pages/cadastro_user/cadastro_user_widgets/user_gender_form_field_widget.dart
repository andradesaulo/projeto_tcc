import 'package:flutter/material.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/drop_down_button_form_field_widget.dart';

class UserGenderFormFieldWidget extends StatelessWidget {
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? initialValue;
  const UserGenderFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownButtonFormFieldWidget(
      hintText: "Gênero",
      menuItems: [
        {"name": "Feminino", "value": "f"},
        {"name": "Masculino", "value": "m"},
        {"name": "Outro", "value": "o"}
      ],
      icon: IconWidget(
        name: Icons.face
      ),
      onChanged: onChanged ?? (value) {},
      onSaved: onSaved,
    );
  }

}