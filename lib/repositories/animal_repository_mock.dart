import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
import 'package:projeto_tcc/repositories/raca_repository_mock.dart';
class AnimalRepositoryMock extends AnimalRepository {
  static List<AnimalModel> animais = [
    AnimalModel(id: 1, idUser: 1, raca: RacaModel(id: 8, nome: "Beagle", tipo: "c"), nome: "Snoopy", sexo: 'm', anoNasc: 2019, problemasSaude: "pulgas,carrapatos", peso: null, altura: null),
    AnimalModel(id: 2, idUser: 3, raca: RacaModel(id: 17, nome: "Angorá", tipo: "g"), nome: "Garfield", sexo: 'm', anoNasc: 2012, problemasSaude: "imunodeficiência,rinotraqueite", peso: null, altura: null),
    AnimalModel(id: 3, idUser: 4, raca: RacaModel(id: 6, nome: "Shih Tzu", tipo: "c"), nome: "Scooby", sexo: 'm', anoNasc: 2015, problemasSaude: null, peso: null, altura: null,),
    AnimalModel(id: 4, idUser: 1, raca: RacaModel(id: 15, nome: "Birmanês", tipo: "g"), nome: "Marie", sexo: 'f', anoNasc: null, problemasSaude: null, peso: null, altura: null),
    AnimalModel(id: 5, idUser: 2, raca: RacaModel(id: 4, nome: "Chihuahua", tipo: "c"), nome: "Lassie", sexo: 'f', anoNasc: null, problemasSaude: "doença do carrapato,cinomose,artrite", peso: null, altura: null),
    AnimalModel(id: 6, idUser: 2, raca: RacaModel(id: 16, nome: "Russo", tipo: "g"), nome: "Tom", sexo: 'm', anoNasc: 2019, problemasSaude: null, peso: null, altura: null),
  ];

  @override
  Future<List<AnimalModel>> getAnimais(int idUser) async {
    await Future.delayed(Duration(seconds: 2));
    final List<AnimalModel> animaisEncontrados = [];
    for (AnimalModel animal in animais) {
      if (animal.idUser == idUser) {
        animaisEncontrados.add(animal);
      }
    }
    return animaisEncontrados;
  }

  @override
  Future<AnimalModel> createAndGetAnimal({required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    await Future.delayed(Duration(seconds: 2));
    final RacaModel raca = (await RacaRepositoryMock().getRaca(idRaca))[0];
    animais.add(
      AnimalModel(id: animais.length + 1, idUser: idUser, raca: raca, nome: nome, sexo: sexo, problemasSaude: problemasSaude, altura: altura, anoNasc: anoNasc, peso: peso)
    );
    return animais[animais.length - 1];
  }

  @override
  Future<AnimalModel> setAnimal({required int idAnimal, required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    await Future.delayed(Duration(seconds: 2));
    final RacaModel raca = (await RacaRepositoryMock().getRaca(idRaca))[0];
    late int posAnimal;
    for (int i = 0; i < animais.length; i++) {
      if (animais[i].id == idAnimal) {
        posAnimal = i;
      }
    }
    final AnimalModel animal = animais[posAnimal];
    animal.nome = nome;
    animal.raca = raca;
    animal.sexo = sexo;
    animal.anoNasc = anoNasc;
    animal.problemasSaude = problemasSaude;
    animal.peso = peso;
    animal.altura = altura;
    return animal;
  }

  @override
  Future deleteAnimal(int idAnimal) async {
    await Future.delayed(Duration(seconds: 1));
    animais.removeWhere((animal) => animal.id == idAnimal);
  }

}