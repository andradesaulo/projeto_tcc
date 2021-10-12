import 'package:flutter/material.dart';
import 'package:projeto_tcc/models/afericao_model.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/pages/pet/pet_afericao/pet_afericao_indicator_widget.dart';
import 'package:projeto_tcc/pages/pet/pet_afericao/pet_afericao_state.dart';
import 'package:projeto_tcc/pages/pet/pet_afericao_controller.dart';
import 'package:projeto_tcc/pages/pet/pet_perfil/pet_perfil_state.dart';
import 'package:projeto_tcc/pages/pet/pet_perfil/pet_perfil_widget.dart';
import 'package:projeto_tcc/pages/pet/pet_perfil_controller.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/linear_progress_indicator_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetPage extends StatefulWidget {
  const PetPage({
    Key? key,
  }) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  final PetPerfilController controllerPerfil = PetPerfilController();
  final PetAfericaoController controllerAfericao = PetAfericaoController();
  AnimalModel? animal;
  List<AfericaoModel> afericoes = [];
  VoidCallback? getAnimaisFunction;

  @override
  void initState() {
    controllerPerfil.listen((state) {
      if (state is PetPerfilStateSuccess) {
        setState(() {});
        Navigator.pop(context);
        getAnimaisFunction!();
      } else if (state is PetPerfilStateFailure) {
        setState(() {});
        print(state.message);
      } else {
        setState(() {});
      }
    });
    controllerAfericao.listen((state) {
      if (state is PetAfericaoStateSuccess) {
        setState(() {
          afericoes = state.afericoes;
        });
      } else if (state is PetAfericaoStateFailure) {
        setState(() {});
        print(state.message);
      } else {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    this.animal = arguments["animal"];
    controllerAfericao.getAfericoes(idAnimal: animal!.id);
    this.getAnimaisFunction = arguments["getAnimaisFunction"][0];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("buildando");
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.colors.appBarBackground,
          title: Text("${animal!.nome}"),
          leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context, animal.toString());
          }),
          bottom: TabBar(
            overlayColor: MaterialStateProperty.all<Color>(AppTheme.colors.appBarBottomOverlay),
            indicatorColor: AppTheme.colors.tabBarIndicator,
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
            Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(width: 1),
                    PetAfericaoIndicatorWidget(
                      type: "bpm", 
                      value: afericoes.isEmpty ? "" : afericoes[afericoes.length - 1].bpm.toString()
                    ),
                    PetAfericaoIndicatorWidget(type: "ox", value: afericoes.isEmpty ? "" : afericoes[afericoes.length - 1].saturacao.toString()
                    ),
                    // SizedBox(width: 1),
                  ],
                ),
              ],
            ),
            PetPerfilWidget(
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
              deleteIndicator: (controllerPerfil.state is PetPerfilStateLoading || controllerPerfil.state is PetPerfilStateSuccess) ? "loading" : "error",
              onDeleted: () {
                controllerPerfil.deleteAnimal(animal!.id);
              }
            )
          ]),
      )
    );
  }
}