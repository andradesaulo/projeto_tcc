import 'package:projeto_tcc/pages/pet/pet_perfil/pet_perfil_state.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
import 'package:projeto_tcc/repositories/animal_repository_sqlite.dart';

class PetPerfilController {
  final AnimalRepository animalRepository = AnimalRepositoryMock();
  Function(PetPerfilState state)? onListen;
  PetPerfilState state = PetPerfilStateEmpty();

  deleteAnimal(int idAnimal) async {
    update(PetPerfilStateLoading());
    try {
      await animalRepository.deleteAnimal(idAnimal);
      update(PetPerfilStateSuccess());
    } catch (e) {
      update(PetPerfilStateFailure(message: e.toString()));
    }

  }

  void update(PetPerfilState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(PetPerfilState state) onFunction) {
    onListen = onFunction;
  }
}