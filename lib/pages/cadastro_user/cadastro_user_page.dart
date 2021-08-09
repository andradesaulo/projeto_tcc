import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/cadastro_user/cadastro_user_controller.dart';
import 'package:projeto_tcc/pages/cadastro_user/cadastro_user_state.dart';
import 'package:projeto_tcc/shared_widgets/drop_down_button_form_field_widget.dart';
import 'package:projeto_tcc/shared_widgets/elevated_button_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/date_form_field_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/user_form_field_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({ Key? key }) : super(key: key);

  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState extends State<CadastroUserPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CadastroUserController controller = CadastroUserController();
  String nome = "";
  DateTime? dataNasc;
  String? genero;

  @override
  void initState() {
    controller.listen((state) {
      if (controller.state is CadastroUserStateSuccess) {
        final user = (controller.state as CadastroUserStateSuccess).user;
        print("${user.id} + ${user.nome} + ${user.genero} + ${user.dataNasc}");
        Navigator.pushReplacementNamed(
          context, 
          "/meus_pets",
          arguments: user
        );
      } else if (controller.state is CadastroUserStateFailure) {
        print((controller.state as CadastroUserStateFailure).message);
      } else {
        setState(() {});
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("building cadastro page");
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se"),
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
                UserFormFieldWidget(
                  inputAction: TextInputAction.next,
                  hasIcon: true,
                  onSaved: (value) {
                    setState(() {
                      nome = value!;
                    });
                  },
                ),
                DropDownButtonFormFieldWidget(
                  hintText: "Gênero", 
                  onSaved: (value) {
                    setState(() {
                      genero = value;
                    });
                  },
                  menuItems: [
                    {"name": "Feminino", "value": "f"},
                    {"name": "Masculino", "value": "m"},
                    {"name": "Outro", "value": "o"}
                  ],
                  onChanged: (value){
                    FocusScope.of(context).nextFocus();
                  },
                ),
                DateFormFieldWidget(
                  hasIcon: true,
                  onSaved: (value) {
                    if (value!.isNotEmpty) { 
                      final List<String> dayMonthYear = value.split("/");
                      final int day = int.parse(dayMonthYear[0]);
                      final int month = int.parse(dayMonthYear[1]);
                      final int year = int.parse(dayMonthYear[2]);
                      setState(() {
                        dataNasc = DateTime(year, month, day);
                      });
                    }
                  },
                  onFieldSubmitted: (value){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      controller.setAndGetUser(nome, dataNasc, genero);
                    }
                  },
                ),
                ElevatedButtonWidget(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      controller.setAndGetUser(nome, dataNasc, genero);
                    }
                  }, 
                  label: "Cadastrar",
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}