import 'package:flutter/material.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_add_button_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetProbSaudeFormFieldWidget extends StatelessWidget {
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final TextInputAction? inputAction;
  final List<String> problemas;
  final Function(int index) onProblemaDeleted;
  final Function(String) onProblemaAdded;
  const PetProbSaudeFormFieldWidget({
    Key? key,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputAction,
    required this.problemas,
    required this.onProblemaDeleted,
    required this.onProblemaAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldInputAddButtonWidget(
          label: "Problemas de saúde", 
          hasIcon: true, 
          autovalidateMode: AutovalidateMode.always,
          icon: IconWidget(name: Icons.local_hospital),
          inputAction: inputAction,
          onAdd: (textController) {
            String campo = textController.text;
            if (campo.isNotEmpty) {
              String problema;
              if(campo[campo.length - 1] == ",") {
                problema = campo.substring(0, campo.length - 1).trim();
              } else {
                problema = campo.trim();
              }
              if(
                //se problema não é formado apenas por caracteres vazios
                problema.length != 0
                //se problema já não existe
                && problemas.indexOf(problema) == -1
              ) {
                onProblemaAdded(problema);                      
                textController.text = "";
              } 
            }
          },
          onChanged: (campo, textController){
            if (
              campo.isNotEmpty
              //se campo terminar com vírgula
              && campo[campo.length - 1] == ","
            ) {
              String problema = campo.substring(0, campo.length - 1).trim();
              if(
                //se problema não é formado apenas por caracteres vazios
                problema.length != 0
                //se problema já não existe
                && problemas.indexOf(problema) == -1
              ) {
                onProblemaAdded(problema);                        
                textController.text = "";
              }
            } 
          },
          helperText: "Insira com vírgula ou com o botão lateral",
          validator: (campo) {
            if (campo!.isNotEmpty) {
              String problema;
              if(campo[campo.length - 1] == ",") {
                problema = campo.substring(0, campo.length - 1).trim();
              } else {
                problema = campo.trim();
              }
              //se problema é formado apenas por caracteres vazios
              if(problema.length == 0) {
                return "Não é possível inserir problemas vazios";
              } 
              //se problema já existe
              if (problemas.indexOf(problema) != -1) {
                return "Este problema de saúde já existe";
              }
              return null;
            } 
          },
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
        ),
        if (problemas.isNotEmpty)
          Wrap(
            children: [
              ...problemas.asMap().entries.map((problema) =>
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(problema.value, style: TextStyle(color: AppTheme.colors.probSaudeText)),
                    deleteIcon: IconWidget(name: Icons.highlight_remove, color: AppTheme.colors.probSaudeDeleteIcon),
                    onDeleted: () => onProblemaDeleted(problema.key),
                    backgroundColor: AppTheme.colors.probSaudeBackground,
                  ),
                )
              )
            ],
          )
      ],
    );
  }
}
