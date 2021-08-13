import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/login/login_controller.dart';
import 'package:projeto_tcc/pages/login/login_state.dart';
import 'package:projeto_tcc/shared_widgets/custom_exception_widget.dart';
import 'package:projeto_tcc/shared_widgets/elevated_button_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/user_form_field_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final LoginController controller = LoginController();

  @override
  void initState() {
    controller.listen((state) {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;
          // print("${user.id} + ${user.nome} + ${user.genero} + ${user.dataNasc}");
          Navigator.pushReplacementNamed(
            context, 
            "/meus_pets", 
            arguments: user
          );
        } else {
          setState((){});
        }
      }
    );
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Falta a logo
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserFormFieldWidget(
                onSaved: (username){
                  controller.getUser(username!);
                },
                onFieldSubmitted: (username) {
                  if(formKey.currentState!.validate()) {
                  controller.getUser(username);}
                },
              ),
              if (controller.state is LoginStateFailure) ...[
                Row(children: [Expanded(
                  child: CustomExceptionWidget(
                    message: (controller.state as LoginStateFailure).message
                  ),
                )]),
                SizedBox(height: 8)
              ]
              else if (controller.state is LoginStateLoading) ...[
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colors.primary)
                  ),
                ),
                SizedBox(height: 14)
              ],
              Row(children: [Expanded(
                child: ElevatedButtonWidget(
                  label: "Entrar",
                  onPressed:() {
                    if(formKey.currentState!.validate()) {
                    formKey.currentState!.save();}
                  }
                )
              )]),
              SizedBox(height: 12),
              Row(children: [Expanded(
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cadastro_user");
                  },
                  label: "Cadastrar-se",
                  isPrimary: false,
                )
              )])
            ],
          ),
        ),
      ),
    );
  }
}