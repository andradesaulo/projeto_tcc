import 'package:projeto_tcc/exceptions/animal_existente_exception.dart';
import 'package:projeto_tcc/models/animal_model.dart';
import 'package:projeto_tcc/pages/cadastro-edicao_pet/cadastro-edicao_pet_state.dart';
import 'package:projeto_tcc/repositories/animal_repository.dart';
import 'package:projeto_tcc/repositories/animal_repository_mock.dart';

class CadastroEdicaoPetController {
  final AnimalRepository animalRepository = AnimalRepositoryMock();
  Function(CadastroEdicaoPetState state)? onListen;
  CadastroEdicaoPetState state = CadastroEdicaoPetStateEmpty();

  createAndGetAnimal({required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    update(CadastroEdicaoPetStateLoading());
    try {
      final AnimalModel animal = await animalRepository.createAndGetAnimal(idUser: idUser, idRaca: idRaca, nome: nome, sexo: sexo, anoNasc: anoNasc, problemasSaude: problemasSaude, peso: peso, altura: altura);
      update(CadastroPetStateSuccess(animal: animal));
    } on AnimalExistenteException catch (e) {
      update(CadastroEdicaoPetStateFailure(message: e.toString()));
    } catch(e) {
      update(CadastroEdicaoPetStateFailure(message: e.toString()));
    }
  }

  setAnimal({required int idAnimal, required int idUser, required int idRaca, required String nome, required String sexo, required int? anoNasc, required String? problemasSaude, required double? peso, required int? altura}) async {
    update(CadastroEdicaoPetStateLoading());
    try {
      final AnimalModel animal = await animalRepository.setAnimal(idAnimal: idAnimal, idUser: idUser, idRaca: idRaca, nome: nome, sexo: sexo, anoNasc: anoNasc, problemasSaude: problemasSaude, peso: peso, altura: altura);
      update(EdicaoPetStateSuccess(animal: animal));
    } on AnimalExistenteException catch (e) {
      update(CadastroEdicaoPetStateFailure(message: e.toString()));
    } catch(e) {
      update(CadastroEdicaoPetStateFailure(message: e.toString()));
    }
  }

  void update(CadastroEdicaoPetState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(CadastroEdicaoPetState state) onFunction) {
    onListen = onFunction;
  }
}