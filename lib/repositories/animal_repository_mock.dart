import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
class AnimalRepositoryMock extends AnimalRepository {
  static List<AnimalModel> animals = [
    AnimalModel(id: 1, idUser: 1, idRaca: 6, nome: "Snoopy", sexo: 'm', idade: 3, problemasSaude: "pulgas", nomeRaca: 'Beagle', tipo: 'c'),
    AnimalModel(id: 2, idUser: 3, idRaca: 17, nome: "Garfield", sexo: 'm', idade: 9, problemasSaude: "imunodeficiência,rinotraqueite", nomeRaca: 'Persa', tipo: 'g',),
    AnimalModel(id: 3, idUser: 4, idRaca: 9, nome: "Scooby", sexo: 'm', idade: 6, nomeRaca: 'Pastor Alemão', tipo: 'c'),
    AnimalModel(id: 4, idUser: 1, idRaca: 15, nome: "Marie", sexo: 'f', nomeRaca: 'Angorá', tipo: 'g'),
    AnimalModel(id: 5, idUser: 2, idRaca: 4, nome: "Lassie", sexo: 'f', problemasSaude: "doença do carrapato,cinomose,artrite", nomeRaca: 'Shih Tzu', tipo: 'c'),
    AnimalModel(id: 6, idUser: 2, idRaca: 14, nome: "Tom", sexo: 'm', idade: 2, nomeRaca: 'Russo', tipo: 'g'),
  ];

  @override
  Future<List<AnimalModel>> getAnimais(int idUser) async {
    await Future.delayed(Duration(seconds: 2));
    final List<AnimalModel> animaisEncontrados = [];
    for (AnimalModel animal in animals) {
      if (animal.idUser == idUser) {
        animaisEncontrados.add(animal);
      }
    }
    return animaisEncontrados;
  }
}