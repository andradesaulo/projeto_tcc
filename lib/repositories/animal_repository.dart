import 'package:projeto_tcc/models/animal_model.dart';

abstract class AnimalRepository{
  Future<List<AnimalModel>> getAnimais(int idUser);
  Future<AnimalModel> createAndGetAnimal({required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura});

  Future<AnimalModel> setAndGetAnimal({required int idAnimal, required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura});
  
  Future deleteAnimal(int idAnimal);
}