import 'package:projeto_tcc/exceptions/raca_inexistente_exception.dart';
import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/repositories/raca_repository.dart';

class RacaRepositoryMock extends RacaRepository {
  static List<RacaModel> racas = [
    RacaModel(id: 1, nome: "Sem raça definida", tipo: "c"),
    RacaModel(id: 2, nome: "Sem raça definida", tipo: "g"),
    RacaModel(id: 3, nome: "Poodle", tipo: "c"),
    RacaModel(id: 4, nome: "Chihuahua", tipo: "c"),
    RacaModel(id: 5, nome: "Pug", tipo: "c"),
    RacaModel(id: 6, nome: "Shih Tzu", tipo: "c"),
    RacaModel(id: 7, nome: "Chow Chow", tipo: "c"),
    RacaModel(id: 8, nome: "Beagle", tipo: "c"),
    RacaModel(id: 9, nome: "Corgi", tipo: "c"),
    RacaModel(id: 10, nome: "Golden Retriever", tipo: "c"),
    RacaModel(id: 11, nome: "Pastor Alemão", tipo: "c"),
    RacaModel(id: 12, nome: "Rottweiler", tipo: "c"),
    RacaModel(id: 13, nome: "Siamês", tipo: "g"),
    RacaModel(id: 14, nome: "Don Sphynx", tipo: "g"),
    RacaModel(id: 15, nome: "Birmanês", tipo: "g"),
    RacaModel(id: 16, nome: "Russo", tipo: "g"),
    RacaModel(id: 17, nome: "Angorá", tipo: "g"),
    RacaModel(id: 18, nome: "Siberiano", tipo: "g"),
    RacaModel(id: 19, nome: "Persa", tipo: "g"),
    RacaModel(id: 20, nome: "Maine Coon", tipo: "g"),
    RacaModel(id: 21, nome: "American Shorthair", tipo: "g"),
    RacaModel(id: 22, nome: "American Wirehair", tipo: "g"),
  ];

  @override
  Future<List<RacaModel>> getRacasCaninas(String nomeRaca) async {
    await Future.delayed(Duration(milliseconds: 100));
    final List<RacaModel> racasEncontradas = [];
    for (RacaModel raca in racas) {
      if (nomeRaca.isNotEmpty && raca.id > 2 && raca.tipo == "c" && raca.nome.indexOf(nomeRaca) != -1) {
        racasEncontradas.add(raca);
      }
    }
    return racasEncontradas;
  }

  @override
  Future<List<RacaModel>> getRacasFelinas(String nomeRaca) async {
    await Future.delayed(Duration(milliseconds: 100));
    final List<RacaModel> racasEncontradas = [];
    for (RacaModel raca in racas) {
      if (nomeRaca.isNotEmpty && raca.id > 2 && raca.tipo == "g" && raca.nome.indexOf(nomeRaca) != -1) {
        racasEncontradas.add(raca);
      }
    }
    return racasEncontradas;
  }

  @override
  Future<List<RacaModel>> getRaca(int idRaca) async {
    await Future.delayed(Duration(milliseconds: 100));
    final List<RacaModel> racaEncontrada = [];
    for (RacaModel raca in racas) {
      if (raca.id == idRaca) {
        racaEncontrada.add(raca);
        break;
      }
    }
    if (racaEncontrada.isNotEmpty) {
      return racaEncontrada;
    } else {
      throw RacaInexistenteException();
    }
  }

  @override
  Future<void> setRaca(String nomeRaca, String tipoRaca) async {
    await Future.delayed(Duration(milliseconds: 100));
    racas.add(
      RacaModel(
        id: racas.length + 1,
        nome: nomeRaca,
        tipo: tipoRaca,
      )
    );
  }
}