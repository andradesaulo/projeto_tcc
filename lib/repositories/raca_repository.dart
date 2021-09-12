import 'package:projeto_tcc/models/raca_model.dart';

abstract class RacaRepository {
  Future<List<RacaModel>> getRacasCaninas(String nomeRaca);
  Future<List<RacaModel>> getRacasFelinas(String nomeRaca);
  Future<List<RacaModel>> getRaca(int idRaca);
  Future<void> setRaca(String nomeRaca, String tipoRaca);
}