import 'package:projeto_tcc/models/afericao_model.dart';

abstract class AfericaoRepository {
  Future<List<AfericaoModel>> getAfericoes({required int idAnimal, DateTime? dataInicio, DateTime? dataFim});
}