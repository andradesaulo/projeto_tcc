import 'package:projeto_tcc/database/databasehelper.dart';
import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/repositories/raca_repository.dart';

class RacaRepositoryMock extends RacaRepository {
  @override
  Future<List<RacaModel>> getRacasCaninas(String nomeRaca) async {
    final db = await DatabaseHelper.instance.database;

    List<Map> maps = await db.query(
      'tb_raca',
      where: "id_raca > 2 AND tipo = 'c' AND nome LIKE ?",
      whereArgs: ['%' + nomeRaca + '%']
    );

    return List.generate(maps.length, (i) => 
      RacaModel(
        id: maps[i]['id_raca'],
        nome: maps[i]['nome'],
        tipo: maps[i]['tipo']
      )
    );
  }

  @override
  Future<List<RacaModel>> getRacasFelinas(String nomeRaca) async {
    final db = await DatabaseHelper.instance.database;

    List<Map> maps = await db.query(
      'tb_raca',
      where: "id_raca > 2 AND tipo = 'c' AND nome LIKE ?",
      whereArgs: ['%' + nomeRaca + '%']
    );

    return List.generate(maps.length, (i) => 
      RacaModel(
        id: maps[i]['id_raca'],
        nome: maps[i]['nome'],
        tipo: maps[i]['tipo']
      )
    );
  }
}