import 'package:flutter/material.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/pages/pet/pet_page/perfil_pet_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetPage extends StatefulWidget {
  const PetPage({
    Key? key,
  }) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  AnimalModel? animal;
  VoidCallback? getAnimaisFunction;
  @override
  void didChangeDependencies() {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    this.animal = arguments["animal"];
    this.getAnimaisFunction = arguments["getAnimaisFunction"][0];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.colors.primary,
          title: Text("${animal!.nome}"),
          leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context, animal.toString());
          }),
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
            PerfilPetWidget(
              animal: animal!, 
              onEdited: () async {
                final arguments = await Navigator.pushNamed(context, "/cadastro-edicao_pet", arguments: {"operacao": "editar", "animal": animal});
                if (arguments != null) {
                  final argumentsMap = arguments as Map;                         
                  if (argumentsMap.containsKey("animal")) {
                    setState(() {
                      animal = arguments["animal"] as AnimalModel;                    
                    });
                    getAnimaisFunction!();
                  } 
                }
              }, 
              onDeleted: (){}
            )
          ]),
      )
    );
  }
}