import 'dart:async';

import 'package:projeto_tcc/database/databasehelper.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/models/user_model.dart';
import 'package:projeto_tcc/exceptions/user_inexistente_exception.dart';

class UserRepositoryMock extends UserRepository {
  @override
  Future<UserModel> getUser(String nome) async {
    final db = await DatabaseHelper.instance.database;
    List<Map> maps = await db.query(
      'tb_usuario',
      where: 'nome = ?',
      whereArgs: [nome],
    );

    if(maps.length == 0) {
      throw UserInexistenteException();
    }

    return UserModel(
      id: maps[0]['id_usuario'],
      nome: maps[0]['nome'],
      dataNasc: maps[0]['data_nasc'] != null ? DateTime.parse(maps[0]['data_nasc']) : null,
      genero: maps[0]['genero']
    );
  }

  @override
  Future<UserModel> createAndGetUser(String nome, DateTime? dataNasc, String? genero) async {
    final db = await DatabaseHelper.instance.database;
    var value = {
      'nome': nome,
      'data_nasc': dataNasc != null ? dataNasc.toString() : null,
      'genero': genero,
    };
    
    await db.insert(
      'tb_usuario',
      value,
    );

    List<Map> maps = await db.query(
      'tb_usuario',
      orderBy: "id_usuario DESC",
      limit: 1
    );

    return UserModel(
      id: maps[0]['id_usuario'],
      nome: maps[0]['nome'],
      dataNasc: maps[0]['data_nasc'] == null ? DateTime.parse(maps[0]['data_nasc']) : null,
      genero: maps[0]['genero']
    );
  }
}