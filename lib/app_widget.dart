import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/cadastro_user/cadastro_user_page.dart';
import 'package:projeto_tcc/pages/login/login_page.dart';
import 'package:projeto_tcc/pages/meus_pets/meus_pets_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('pt', 'BR'),
      title: "Projeto TCC",
      initialRoute: "/login",
      routes: {
        "/login" : (context) => LoginPage(),
        "/cadastro_user" : (context) => CadastroUserPage(),
        "/meus_pets" : (context) => MeusPetsPage(),
      },
    );
  }
}