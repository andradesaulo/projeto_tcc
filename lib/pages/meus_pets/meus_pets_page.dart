import 'package:flutter/material.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/models/user_model.dart';
import 'package:projeto_tcc/pages/meus_pets/meus_pets_controller.dart';
import 'package:projeto_tcc/pages/meus_pets/meus_pets_state.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/list_tile_widget.dart';
import 'package:projeto_tcc/theme/app_list_tile_colors.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class MeusPetsPage extends StatefulWidget {
  const MeusPetsPage({ Key? key }) : super(key: key);

  @override
  _MeusPetsPageState createState() => _MeusPetsPageState();
}

class _MeusPetsPageState extends State<MeusPetsPage> {
  final MeusPetsController controller = MeusPetsController();
  List<AnimalModel> animais = [];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      final UserModel user = 
        ModalRoute.of(context)!.settings.arguments as UserModel;
      controller.getAnimais(user.id);
      controller.listen((state) {
        if (controller.state is MeusPetsStateSuccess) {
          setState(() {
            animais = (controller.state as MeusPetsStateSuccess).animais;
          });
        } else {
          setState(() {});
        }
      });
    });
    super.initState();
  }

  String idadeFormatada(int? idade) => 
    idade == 1 
    ? "$idade ano -" 
    : "$idade anos -";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Pets"),
        centerTitle: true,
        backgroundColor: AppTheme.colors.primary,
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            if (controller.state is MeusPetsStateSuccess) ...[
              for (var i = 0; i < animais.length; i++) 
                ListTileWidget(
                  title: "${animais[i].nome}",
                  subtitle: animais[i].idade != null 
                      ? "${idadeFormatada(animais[i].idade)} ${animais[i].nomeRaca}"
                      : "${animais[i].nomeRaca}",
                  colorId: i,
                  iconUrl: 
                    animais[i].tipo == "c" 
                    ? "dog_icon_opaque.png"
                    : "cat_icon_opaque.png",
                )
            ]
            else if (controller.state is MeusPetsStateLoading) ...[
              CircularProgressIndicator(),
            ]
            else if (controller.state is MeusPetsStateFailure) ...[
              Text((controller.state as MeusPetsStateFailure).message)
            ]
          ],
        ),
      ),
    );
  }
}