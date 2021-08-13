import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
class AnimalRepositoryMock extends AnimalRepository {
  static List<AnimalModel> _animals = [
    AnimalModel(id: 1, idUser: 1, idRaca: 1, nome: "Snoopy", sexo: 'm', idade: 3, problemasSaude: ["pulgas"], nomeRaca: 'Beagle', tipo: 'c'),
    AnimalModel(id: 2, idUser: 3, idRaca: 1, nome: "Garfield", sexo: 'm', idade: 9, problemasSaude: ["imunodeficiência", "rinotraqueite"], nomeRaca: 'Persa', tipo: 'g',),
    AnimalModel(id: 3, idUser: 4, idRaca: 2, nome: "Scooby", sexo: 'm', idade: 6, nomeRaca: 'Dogue Alemão', tipo: 'c'),
    AnimalModel(id: 4, idUser: 1, idRaca: 1, nome: "Marie", sexo: 'f', nomeRaca: 'Angorá', tipo: 'g'),
    AnimalModel(id: 5, idUser: 2, idRaca: 1, nome: "Lassie", sexo: 'f', problemasSaude: ["doença do carrapato", "cinomose", "artrite"], nomeRaca: 'Collie', tipo: 'c'),
    AnimalModel(id: 6, idUser: 2, idRaca: 1, nome: "Tom", sexo: 'm', idade: 2, nomeRaca: 'Russian Blue', tipo: 'c'),
  ];

  @override
  Future<List<AnimalModel>> getAnimais(int idUser) async {
    await Future.delayed(Duration(seconds: 2));
    final List<AnimalModel> animaisEncontrados = [];
    for (AnimalModel animal in _animals) {
      if (animal.idUser == idUser) {
        animaisEncontrados.add(animal);
      }
    }
    if (animaisEncontrados.length != 1) {
      return animaisEncontrados;
    } else {
      throw Error();
    }
  }
}