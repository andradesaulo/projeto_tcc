import 'package:flutter/material.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_controller.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_state.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_altura_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_idade_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_nome_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_peso_form_field.widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_prob_saude_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_raca_form_field/pet_raca_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_sexo_form_field_widget.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_widgets/pet_tipo_form_field_widget.dart';
import 'package:projeto_tcc/shared_widgets/custom_exception_widget.dart';
import 'package:projeto_tcc/shared_widgets/elevated_button_widget.dart';
import 'package:projeto_tcc/shared_widgets/linear_progress_indicator_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class CadastroEdicaoPetPage extends StatefulWidget {
  const CadastroEdicaoPetPage({ Key? key }) : super(key: key);

  @override
  _CadastroEdicaoPetPageState createState() => _CadastroEdicaoPetPageState();
}

class _CadastroEdicaoPetPageState extends State<CadastroEdicaoPetPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CadastroEdicaoPetController controller = CadastroEdicaoPetController();
  String? msgErro = "";

  int? idRacaEscolhida;
  int? idAnimal;
  String? nome;
  int? anoNasc;
  String? sexo;
  List<String> problemas = [];
  double? peso;
  int? altura;

  String? operacao;
  String? nomeRaca;
  int? idUser;
  String? tipoAnimal;

  var getAnimaisFunction;

  @override
  void initState() {
    controller.listen((state) {
      if (state is CadastroPetStateSuccess) {
        Navigator.popAndPushNamed(
          context, 
          "/pet",
          arguments: {
            "animal": state.animal, 
            "getAnimaisFunction": getAnimaisFunction,
          }
        );
        setState(() {
          msgErro = "";        
        });
        getAnimaisFunction![0]();
      } else if (state is EdicaoPetStateSuccess) {
        Navigator.pop(context, {"animal": state.animal});
      } else if (state is CadastroEdicaoPetStateFailure) {
        setState((){
          msgErro = state.message;
        });
      } else {
        setState((){});
      }
    });
    super.initState();
  }

  @override 
  void didChangeDependencies() {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    late AnimalModel animal;
    //Vindo de Meus Pets Page
    if (arguments.containsKey("userId")) {
      idUser = arguments["userId"];
      getAnimaisFunction = arguments["getAnimaisFunction"];
    } else { //Ou vindo de Pet Page
      animal = arguments["animal"];
      operacao = arguments["operacao"];
      idUser = animal.idUser;
      idAnimal = animal.id;
      nome = animal.nome;
      sexo = animal.sexo;
      tipoAnimal = animal.raca.tipo;
      idRacaEscolhida = animal.raca.id;
      nomeRaca = animal.raca.nome;
      peso = animal.peso;
      altura = animal.altura;
      anoNasc = animal.anoNasc;
      problemas = animal.problemasSaude == null ? [] : animal.problemasSaude!.split(",");
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: operacao == "editar" ? Text("Editar Pet") : Text("Cadastrar Pet"),
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
                  initialValue: nome,
                  onSaved: (petNome) {
                    setState(() {
                      nome = petNome;
                    });
                  },
                ),
                PetSexoFormFieldWidget(
                  initialValue: sexo,
                  onSaved: (petSexo) {
                    setState(() {
                      sexo = petSexo;
                    });
                  },
                ),
                PetTipoFormFieldWidget(
                  initialValue: tipoAnimal,
                  onChanged: (value) {
                    setState(() {
                      tipoAnimal = value;
                      idRacaEscolhida = null;
                    });
                  },
                ),
                PetRacaFormFieldWidget(
                  initialValue: nomeRaca,
                  tipoAnimal: tipoAnimal,
                  onChangedRadio: (racaId) {
                    setState(() {
                      idRacaEscolhida = racaId;
                    });
                  },
                  idRacaEscolhida: idRacaEscolhida,
                ),
                PetPesoFormFieldWidget(
                  initialValue: peso == null ? null : peso.toString().replaceFirst(".", ","),
                  onSaved: (petPeso) {
                    setState(() {
                      peso = petPeso;                    
                    });
                  },
                ),
                PetAlturaFormFieldWidget(
                  initialValue: altura == null ? null : altura.toString(),
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
                  initialValue: anoNasc == null ? null : (DateTime.now().year - (anoNasc as num)).toString(),
                  onSaved: (petIdade) {
                    setState(() {
                      anoNasc = petIdade;
                    });
                  },
                ),
                if (msgErro!.isNotEmpty) ...[
                  CustomExceptionWidget(message: msgErro!)
                ]
                else if (controller.state is CadastroEdicaoPetStateLoading) ...[
                  LinearProgressIndicatorWidget(),
                ],
                Padding(
                  padding: EdgeInsets.only(top: (controller.state is CadastroEdicaoPetStateLoading) ? 0 : 10),
                  child: Row(
                    mainAxisAlignment: operacao == "editar" ? MainAxisAlignment.spaceAround : MainAxisAlignment.end,
                    children: [
                      if (operacao == "editar") ...[
                        Expanded(
                          child: ElevatedButtonWidget(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                if (idRacaEscolhida == null) {
                                  setState(() {                                
                                    msgErro = "Selecione uma raça";
                                  });
                                } else {
                                  msgErro = "";
                                  formKey.currentState!.save();
                                  controller.setAnimal(idAnimal: idAnimal!, idUser: idUser!, idRaca: idRacaEscolhida!, nome: nome!, sexo: sexo!, anoNasc: anoNasc, problemasSaude: problemas.isEmpty ? null : problemas.join(","), peso: peso, altura: altura);
                                }
                              }
                            },
                            label: "Salvar",
                            isPrimary: false,
                          ),
                        ),
                      ] else ...[
                        ElevatedButtonWidget(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              if (idRacaEscolhida == null) {
                                setState(() {                                
                                  msgErro = "Selecione uma raça";
                                });
                              } else {
                                msgErro = "";
                                formKey.currentState!.save();
                                controller.createAndGetAnimal(idUser: idUser!, idRaca: idRacaEscolhida!, nome: nome!, sexo: sexo!, anoNasc: anoNasc, problemasSaude: problemas.isEmpty ? null : problemas.join(","), peso: peso, altura: altura);
                              }
                            }
                          },
                          label: "Cadastrar",
                        ),
                      ],
                      if (operacao == "editar") ...[
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButtonWidget(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            label: "Cancelar",
                          ),
                        )
                      ]
                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}