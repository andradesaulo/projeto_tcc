import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class PetPesoFormFieldWidget extends StatelessWidget {
  final Function(String, TextEditingController?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(double?) onSaved;
  final TextInputAction? inputAction;
  final String? initialValue;
  const PetPesoFormFieldWidget({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.onSaved,
    this.inputAction, this.initialValue,
  }) : super(key: key);

  void trataPeso(String peso, TextEditingController controller, {String? novoPeso}) {
    controller.text = novoPeso ?? peso.substring(0, peso.length - 1);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length)
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldInputWidget(
      label: "Peso (kg)", 
      initialValue: initialValue,
      hasIcon: true, 
      icon: IconWidget(name: Icons.fitness_center),
      keyboardType: TextInputType.number,
      inputAction: inputAction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9,]')), LengthLimitingTextInputFormatter(7)
      ],
      onChanged: onChanged ?? (peso, controller){
        List<String> decimalInt = peso.split(",");
        //tamDecimal começa com 0 pois pode não haver parte decimal
        int tamDecimal = 0;
        //Há 1 vírgula quando o tamanho do split é 2
        if (decimalInt.length == 2) {
          peso.length == 1
          ? trataPeso(peso, controller!, novoPeso: "0,")
          : tamDecimal = decimalInt[1].length;
        }
        //Há 2 vírgulas quando o tamanho do split é 3
        if(decimalInt.length == 3 || tamDecimal > 3) {
          trataPeso(peso, controller!); 
        } 
      },
      validator: (peso) {
        if (peso!.isNotEmpty) {
          List<String> decimalInt = peso.split(",");
          if ((decimalInt.length == 2) && (decimalInt[1].length > 3)) {
            return "Gramas incorretas";
          }
          double pesoFormatado = 
            double.tryParse(peso.replaceFirst(",", ".")) ?? 0;

          if (pesoFormatado == 0) {
            return "Peso inválido";
          } 
          if (pesoFormatado > 200) {
            return "O peso não deve ultrapassar 200kg";
          }
        }
      },
      onSaved: (petPeso) {
        onSaved(double.tryParse(petPeso!.replaceFirst(",", ".")));
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
