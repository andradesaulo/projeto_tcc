import 'package:flutter/material.dart';

import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_raca_form_field/pet_raca_form_field_controller.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_raca_form_field/pet_raca_form_field_state.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetRacaFormFieldWidget extends StatefulWidget {
  final Function(String, TextEditingController?)? onChanged;
  final Function(int?) onChangedRadio;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final TextInputAction? inputAction;
  final String? tipoAnimal;
  final int? idRacaEscolhida;
  final String? initialValue;
  const PetRacaFormFieldWidget({
    Key? key,
    this.onChanged,
    required this.onChangedRadio,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputAction,
    this.tipoAnimal,
    this.idRacaEscolhida,
    this.initialValue,
  }) : super(key: key);

  @override
  _PetRacaFormFieldWidgetState createState() => _PetRacaFormFieldWidgetState();
}

class _PetRacaFormFieldWidgetState extends State<PetRacaFormFieldWidget> {
  PetRacaFormFieldController controller = PetRacaFormFieldController();
  List<RacaModel> racas = [];
  String campo = "";
  @override
  void initState() {
    campo = widget.initialValue == null ? "" : widget.initialValue!;
    controller.listen((state){
      if (state is PetRacaFormFieldStateSuccess) {
        setState(() {
          racas = state.racas;
        });
      }
    });
    if(widget.tipoAnimal != null) {
      controller.getRacas(widget.tipoAnimal!, campo);
    }
    super.initState();
  }
  
  @override
    void didUpdateWidget(covariant PetRacaFormFieldWidget oldWidget) {
      if(widget.tipoAnimal != null) {
        controller.getRacas(widget.tipoAnimal!, campo);
      } else {
        setState(() {
          racas = [];      
        });
      }
      super.didUpdateWidget(oldWidget);
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldInputWidget(
          initialValue: widget.initialValue,
          enabled: widget.tipoAnimal == null ? false : true,
          label: "Raça",
          helperText: 
            widget.tipoAnimal == null 
            ? "Insira o tipo de animal primeiro"
            : "Pesquise e escolha uma raça",
          hasIcon: true,
          icon: IconWidget(
            name: Icons.pets,
          ),
          inputAction: widget.inputAction,
          onChanged: (campo, controllerCampo) {
            widget.onChangedRadio(null);
            setState(() {            
              this.campo = campo;
            });  
          },
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            children: [
              for (RacaModel raca in racas) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: RadioListTile<int>(
                      value: raca.id, 
                      dense: true,
                      groupValue: widget.idRacaEscolhida,
                      onChanged: (racaId) => widget.onChangedRadio(racaId!),
                      title: Text(raca.nome),
                      tileColor: AppTheme.colors.inputBackground,
                      activeColor: Colors.white,
                      selected: raca.id == widget.idRacaEscolhida ? true : false,
                      selectedTileColor: AppTheme.colors.secondary,
                    ),
                  ),
                )
              ],
              if(widget.tipoAnimal != null) ...[
              Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: RadioListTile<int>(
                      value: widget.tipoAnimal! == "c" ? 1 : 2, 
                      dense: true,
                      groupValue: widget.idRacaEscolhida,
                      onChanged: (racaId) => widget.onChangedRadio(racaId!),
                      title: Text("Raça não definida (Vira-lata)"),
                      tileColor: AppTheme.colors.inputBackground,
                      activeColor: Colors.white,
                      selected: (widget.tipoAnimal! == "c" ? 1 : 2) == widget.idRacaEscolhida ? true : false,
                      selectedTileColor: AppTheme.colors.secondary,
                    ),
                  ),
                )
              ],
              if(widget.tipoAnimal != null)
                SizedBox(height: 10) 
            ]
          ),
        )
      ],
    );
  }
}