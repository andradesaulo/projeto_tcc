import 'package:flutter/material.dart';

import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PerfilPetWidget extends StatelessWidget {
  final AnimalModel animal;
  final void Function() onEdited;
  final void Function() onDeleted;
  const PerfilPetWidget({
    Key? key,
    required this.animal,
    required this.onEdited,
    required this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Nome: ",
                      style: AppTheme.textStyles.titleInfoPet,
                      children: [
                    TextSpan(
                      text: "${animal.nome}", 
                      style: AppTheme.textStyles.textInfoPet)
                  ])),
                  SizedBox(height: 10),
                  if(animal.anoNasc != null) ...[
                    Text.rich(
                      TextSpan(
                        text: "Idade: ",
                        style: AppTheme.textStyles.titleInfoPet,
                        children: [
                      TextSpan(
                        text: "${DateTime.now().year - animal.anoNasc!} ano${DateTime.now().year - animal.anoNasc! == 1 ? '' : 's'}", 
                        style: AppTheme.textStyles.textInfoPet)
                    ])),
                    SizedBox(height: 10),
                  ],
                  Text.rich(
                      TextSpan(
                        text: "Sexo: ",
                        style: AppTheme.textStyles.titleInfoPet,
                        children: [
                      TextSpan(
                        text: "${animal.sexo == 'f' ? 'Fêmea' : animal.sexo == 'm' ? 'Macho' : 'Não definido'}", 
                        style: AppTheme.textStyles.textInfoPet)
                    ])),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "Raça: ",
                      style: AppTheme.textStyles.titleInfoPet,
                      children: [
                    TextSpan(
                      text: "${animal.raca.nome}", 
                      style: AppTheme.textStyles.textInfoPet)
                  ])),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "Tipo: ",
                      style: AppTheme.textStyles.titleInfoPet,
                      children: [
                    TextSpan(
                      text: "${animal.raca.tipo == "c" ? 'Cachorro' : 'Gato'}", 
                      style: AppTheme.textStyles.textInfoPet)
                  ])),
                  SizedBox(height: 10),
                  if(animal.peso != null) ...[
                    Text.rich(
                      TextSpan(
                        text: "Peso: ",
                        style: AppTheme.textStyles.titleInfoPet,
                        children: [
                      TextSpan(
                        text: "${animal.peso} kg", 
                        style: AppTheme.textStyles.textInfoPet)
                    ])),
                    SizedBox(height: 10),
                  ],
                  if(animal.altura != null) ...[
                    Text.rich(
                      TextSpan(
                        text: "Altura: ",
                        style: AppTheme.textStyles.titleInfoPet,
                        children: [
                      TextSpan(
                        text: "${animal.altura} cm", 
                        style: AppTheme.textStyles.textInfoPet)
                    ])),
                    SizedBox(height: 10),
                  ],
                  if(animal.problemasSaude != null) ...[
                    Text("Problemas de saúde:", style: AppTheme.textStyles.titleInfoPet),
                    SizedBox(height: 10),
                    Text("${animal.problemasSaude!.split(',').join(", ")}", style: AppTheme.textStyles.textInfoPet),
                  ],
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "btn_edit",
                        mini: true,
                        backgroundColor: Colors.grey,
                        child: IconWidget(
                          name: Icons.edit,
                          size: 20,
                          color: Colors.white,
                        ), 
                        onPressed: onEdited,
                      ),
                      FloatingActionButton(
                        heroTag: "btn_delete",
                        mini: true,
                        backgroundColor: AppTheme.colors.error,
                        child: IconWidget(
                          name: Icons.delete_outline,
                          size: 20,
                          color: Colors.white,
                        ), 
                      onPressed: (){
                        
                      })
                    ],
                  )
                ],
              ),
            );
  }
}
