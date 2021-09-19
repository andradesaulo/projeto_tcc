import 'dart:async';

import 'package:projeto_tcc/exceptions/user_existente_exception.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/models/user_model.dart';
import 'package:projeto_tcc/exceptions/user_inexistente_exception.dart';

class UserRepositoryMock extends UserRepository {
  static List<UserModel> users = [
    UserModel(id: 1, nome: "Saulo", dataNasc: DateTime(1997), genero: "m"),
    UserModel(id: 2, nome: "Ana", dataNasc: DateTime(1999), genero: "f"),
    UserModel(id: 3, nome: "Maria", dataNasc: DateTime(1996), genero: "f"),
    UserModel(id: 4, nome: "Pedro", dataNasc: DateTime(2000), genero: "m"),
  ];

  @override
  Future<UserModel?> getUser(String nome) async {
    await Future.delayed(Duration(seconds: 2));
    UserModel? userExistente;
    for (UserModel user in users) {
      if (user.nome == nome) {
        userExistente = user;
        break;
      }
    }
    if (userExistente != null) {
      return userExistente;
    } else {
      throw UserInexistenteException();
    }
  }

  @override
  Future<UserModel> createAndGetUser(String nome, DateTime? dataNasc, String? genero) async {
    await Future.delayed(Duration(seconds: 2));
    for (UserModel user in users) {
      if (user.nome == nome) {
        throw UserExistenteException();
      }
    }
    users.add(
      UserModel(
        id: users.length + 1, 
        nome: nome,
        dataNasc: dataNasc,
        genero: genero
      )
    );
    return users[users.length - 1];
  }
}