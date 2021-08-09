import 'package:projeto_tcc/models/pet_model.dart';

abstract class PetsRepository{
  Future<List<PetModel>> getPets(int userId);
}