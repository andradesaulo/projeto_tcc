import 'package:projeto_tcc/database/databasehelper.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
class AnimalRepositoryMock extends AnimalRepository {
  @override
  Future<List<AnimalModel>> getAnimais(int idUser) async {
    final db = await DatabaseHelper.instance.database;
    List<Map> maps = await db.rawQuery('''    
      SELECT id_animal, id_usuario, tb_animal.id_raca AS id_raca, tb_raca.nome AS nome_raca, tipo, tb_animal.nome AS nome_animal, sexo, ano_nasc, problemas_saude, peso, altura
      FROM tb_animal
      INNER JOIN tb_raca
      ON tb_raca.id_raca = tb_animal.id_raca
      WHERE id_usuario = ?
    ''', [idUser]);
    return List.generate(maps.length, (i) => 
      AnimalModel(
        id: maps[i]['id_animal'], 
        idUser: maps[i]['id_usuario'], 
        raca: RacaModel(
          id: maps[i]['id_raca'],
          nome: maps[i]['nome_raca'],
          tipo: maps[i]['tipo']
        ),
        nome: maps[i]['nome_animal'], 
        sexo: maps[i]['sexo'], 
        anoNasc: maps[i]['ano_nasc'], 
        problemasSaude: maps[i]['problemas_saude'], 
        peso: maps[i]['peso'], 
        altura: maps[i]['altura']
      )
    );
  }

  @override
  Future<AnimalModel> createAndGetAnimal({required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    final db = await DatabaseHelper.instance.database;
    var value = {
      'id_usuario': idUser,
      'id_raca': idRaca,
      'nome': nome,
      'sexo': sexo,
      'ano_nasc' : anoNasc,
      'problemas_saude' : problemasSaude,
      'peso': peso,
      'altura': altura,
    };

    await db.insert(
      'tb_animal', 
      value
    );

    List<AnimalModel> animais = await getAnimais(idUser);
    return animais[animais.length - 1];
  }

  @override
  Future<AnimalModel> setAndGetAnimal({required int idAnimal, required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    final db = await DatabaseHelper.instance.database;
    var value = {
      'id_usuario': idUser,
      'id_raca': idRaca,
      'nome': nome,
      'sexo': sexo,
      'ano_nasc' : anoNasc,
      'problemas_saude' : problemasSaude,
      'peso': peso,
      'altura': altura,
    };

    await db.update(
      'tb_animal', 
      value,
      where: 'id_animal = ?',
      whereArgs: [idAnimal],
    );

    List<AnimalModel> animais = await getAnimais(idUser);
    late AnimalModel animalEncontrado;
    for (int i = 0; i < animais.length; i++) {
      if (animais[i].id == idAnimal) {
        animalEncontrado = animais[i];
      }
    }

    return animalEncontrado;
  }

  @override
  Future deleteAnimal(int idAnimal) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'tb_animal',
      where: 'id_animal = ?',
      whereArgs: [idAnimal]
    );
  }

}