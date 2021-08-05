import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/login/login_controller.dart';
import 'package:projeto_tcc/pages/login/login_state.dart';
import 'package:projeto_tcc/shared_widgets/text_field_input.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  final LoginController controller = LoginController();

  @override
  void initState() {
    controller.listen((state) {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;
          Navigator.pushReplacementNamed(
            context, 
            "/meus_pets", 
            arguments: user
          );
        } else if (controller.state is LoginStateFailure){
          print((controller.state as LoginStateFailure).message);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInputWidget(
              label: "Usuário",
              onChanged: (value) => username = value
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppTheme.colors.primary),
                    ),
                    onPressed: (){
                      controller.getUser(username);
                    }, 
                    child: Text("Entrar")
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppTheme.colors.primaryOpaque),
                      overlayColor: MaterialStateProperty.all<Color>(AppTheme.colors.primary),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, "/cadastro_user");
                    }, 
                    child: Text("Cadastrar-se")
                  ),
                ),
              ],
            )
            ],
        ),
      ),
    );
  }
}