import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/models/user_model.dart';

class UserRepositoryMock extends UserRepository {
  List<UserModel> _Users = [
    UserModel(id: 1, nome: "Saulo", dataNasc: DateTime(1997), genero: "m"),
    UserModel(id: 2, nome: "Ana", dataNasc: DateTime(1999), genero: "f"),
    UserModel(id: 3, nome: "Maria", dataNasc: DateTime(1996), genero: "f"),
    UserModel(id: 4, nome: "Pedro", dataNasc: DateTime(2000), genero: "m"),
  ];

  @override
  Future<UserModel> getUser(String nome) async {
    await Future.delayed(Duration(seconds: 2));
    for (UserModel User in _Users) {
      if (User.nome == nome) {
        return User;
      }
    }
    throw Error();
  }

}