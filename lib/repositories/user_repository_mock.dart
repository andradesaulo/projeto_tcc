import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/models/user_model.dart';

class UserRepositoryMock extends UserRepository {
  static List<UserModel> _users = [
    UserModel(id: 1, nome: "Saulo", dataNasc: DateTime(1997), genero: "m"),
    UserModel(id: 2, nome: "Ana", dataNasc: DateTime(1999), genero: "f"),
    UserModel(id: 3, nome: "Maria", dataNasc: DateTime(1996), genero: "f"),
    UserModel(id: 4, nome: "Pedro", dataNasc: DateTime(2000), genero: "m"),
  ];

  @override
  Future<UserModel> getUser(String nome) async {
    await Future.delayed(Duration(seconds: 2));
    for (UserModel user in _users) {
      if (user.nome == nome) {
        return user;
      }
    }
    throw Error();
  }

  @override
  Future<bool> setUser(String nome, DateTime? dataNasc, String? genero) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      int id = 1;
      while(true) {
        final int idAntigo = id;
        for (UserModel user in _users) {
          if (user.id == id) {
            id++;
            break;
          }
        }
        if (idAntigo == id) {
          break;
        }
        continue;
      }
      _users.add(
        UserModel(
          id: id, 
          nome: nome,
          dataNasc: dataNasc,
          genero: genero
        )
      );
      return true;
    } catch(e) {
      return false;
    }
  }
  

}