import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/pages/meus_pets/meus_pets_state.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
import 'package:projeto_tcc/repositories/animal_repository_mock.dart';

class MeusPetsController {
  final AnimalRepository animalRepository = AnimalRepositoryMock();
  Function(MeusPetsState state)? onListen;
  MeusPetsState state = MeusPetsStateEmpty();

  getAnimais(int idUser) async {
    update(MeusPetsStateLoading());
    try {
      final List<AnimalModel> animais = await animalRepository.getAnimais(idUser);
      if (animais.isEmpty) {
        update(MeusPetsStateEmpty());
      } else {
        update(MeusPetsStateSuccess(animais: animais));
      }
    } catch(e) {
      update(MeusPetsStateFailure(message: e.toString()));
    }
  }

  void update(MeusPetsState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(MeusPetsState state) onFunction) {
    onListen = onFunction;
  }
}