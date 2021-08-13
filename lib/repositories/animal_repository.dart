import 'package:projeto_tcc/models/animal_model.dart';

abstract class AnimalRepository{
  Future<List<AnimalModel>> getAnimais(int idUser);
}