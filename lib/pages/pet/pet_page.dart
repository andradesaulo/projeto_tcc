import 'package:flutter/material.dart';

import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetPage extends StatefulWidget {
  const PetPage({
    Key? key,
  }) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) { 
  //     setState(() {      
  //       animal = 
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
  AnimalModel animal = ModalRoute.of(context)!.settings.arguments as AnimalModel;
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.colors.primary,
          title: Text("${animal.nome}"),
          bottom: TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab(
                icon: Icon(Icons.timer),
                text: "Status"
              ),
              Tab(
                icon: Icon(Icons.pets),
                text: "Perfil do Pet"
              ),
            ]
          )
        ),
        body: TabBarView(
          children: [
            Text("status"),
            Column(
              children: [
                Text("Nome", style: AppTheme.textStyles.titleInfoPet),
                Text("${animal.nome}"),
                if(animal.idade != null) ...[
                  Text("Idade", style: AppTheme.textStyles.titleInfoPet),
                  Text("${animal.idade} ano${animal.idade == 1 ? '' : 's'}"),
                ],
                Text("Sexo", style: AppTheme.textStyles.titleInfoPet),
                Text("${animal.sexo == 'f' ? 'Fêmea' : animal.sexo == 'm' ? 'Macho' : 'Não definido'}"),
                Text("Raça", style: AppTheme.textStyles.titleInfoPet),
                Text("${animal.nomeRaca}"),
                if(animal.peso != null) ...[
                  Text("Peso", style: AppTheme.textStyles.titleInfoPet),
                  Text("${animal.peso} kg"),
                ],
                if(animal.altura != null) ...[
                  Text("Altura", style: AppTheme.textStyles.titleInfoPet),
                  Text("${animal.altura} cm"),
                ],
                if(animal.problemasSaude != null) ...[
                  Text("Problemas de saúde", style: AppTheme.textStyles.titleInfoPet),
                  Text("${animal.problemasSaude}"),
                ]
              ],
            )
          ]),
      )
    );
  }
}