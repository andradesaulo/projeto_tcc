import 'package:projeto_tcc/models/raca_model.dart';

abstract class RacaRepository {
  Future<List<RacaModel>> getRacasCaninas(String nomeRaca);
  Future<List<RacaModel>> getRacasFelinas(String nomeRaca);
}