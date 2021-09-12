import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_altura_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_idade_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_nome_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_peso_form_field.widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_prob_saude_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_raca_form_field/pet_raca_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_sexo_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_tipo_form_field_widget.dart';
import 'package:projeto_tcc/shared_widgets/elevated_button_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class CadastroPetPage extends StatefulWidget {
  const CadastroPetPage({ Key? key }) : super(key: key);

  @override
  _CadastroPetPageState createState() => _CadastroPetPageState();
}

class _CadastroPetPageState extends State<CadastroPetPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? idRacaEscolhida;
  String? nome;
  int? anoNasc;
  String? sexo;
  List<String> problemas = [];
  double? peso;
  int? altura;

  String? tipoAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Pet"),
        centerTitle: true,
        backgroundColor: AppTheme.colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15, right: 15, bottom: 15, 
          left: 20
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PetNomeFormFieldWidget(
                  onSaved: (petNome) {
                    setState(() {
                      nome = petNome;
                    });
                  },
                ),
                PetSexoFormFieldWidget(
                  onSaved: (petSexo) {
                    setState(() {
                      sexo = petSexo;
                    });
                  },
                ),
                PetTipoFormFieldWidget(
                  onChanged: (value) {
                    setState(() {
                      tipoAnimal = value;
                      idRacaEscolhida = null;
                    });
                  },
                ),
                PetRacaFormFieldWidget(
                  tipoAnimal: tipoAnimal,
                  onChangedRadio: (racaId) {
                    setState(() {
                      idRacaEscolhida = racaId;
                    });
                  },
                  idRacaEscolhida: idRacaEscolhida,
                ),
                PetPesoFormFieldWidget(
                  onSaved: (petPeso) {
                    setState(() {
                      peso = petPeso;                    
                    });
                  },
                ),
                PetAlturaFormFieldWidget(
                  onSaved: (petAltura) {
                    setState(() {
                      altura = petAltura;            
                    });
                  },
                ),
                PetProbSaudeFormFieldWidget(
                  problemas: problemas,
                  onProblemaDeleted: (problemaIndex){
                    setState(() {
                      problemas.removeAt(problemaIndex);
                    });
                  },
                  onProblemaAdded: (problema) {
                    setState(() {
                      problemas.add(problema);                        
                    });
                  },
                ),
                PetIdadeFormFieldWidget(
                  onSaved: (petIdade) {
                    setState(() {
                      anoNasc = petIdade;
                    });
                  },
                ),
                ElevatedButtonWidget(
                  onPressed: (){
                    if(formKey.currentState!.validate() && idRacaEscolhida != null){
                      formKey.currentState!.save();
                      final int userId = 
                        ModalRoute.of(context)!.settings.arguments as int;
                      print("userId:'$userId' nome:'$nome'-sexo:'$sexo' idRaca:'$idRacaEscolhida' peso:'$peso' altura:'$altura' problemas:'${problemas.join(",")}' anoNasc:'$anoNasc'");
                    }
                  },
                  label: "Cadastrar"
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}