import 'package:projeto_tcc/database/databasehelper.dart';
import 'package:projeto_tcc/models/afericao_model.dart';
import 'package:projeto_tcc/repositories/afericao_repository.dart';

class AfericaoRepositoryMock extends AfericaoRepository {
  @override
  Future<List<AfericaoModel>> getAfericoes({required int idAnimal, DateTime? dataInicio, DateTime? dataFim}) async {
    final db = await DatabaseHelper.instance.database;
    late List<Map> maps;
    if (dataInicio == null || dataFim == null) {
      maps = await db.query(
        'tb_afericao',
        where: 'id_animal = ?',
        whereArgs: [idAnimal]
      );
      print(maps.toString());
    } else {
      maps = await db.query(
        'tb_afericao',
        where: 'id_animal = ? AND data_horario >= ? AND data_horario <= ?',
        whereArgs: [idAnimal, dataInicio, dataFim]
      );
      print(maps.toString());
    }
    return List.generate(maps.length, (i) => 
      AfericaoModel(
        id: maps[i]['id_afericao'], 
        idAnimal: maps[i]['id_animal'], 
        saturacao: maps[i]['saturacao_ox'],
        bpm: maps[i]['bpm'], 
        dataHorario: DateTime.parse(maps[0]['data_horario']),
      )
    );
  }
}