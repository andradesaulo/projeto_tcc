import 'package:projeto_tcc/models/raca_model.dart';
import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_widgets/pet_raca_form_field/pet_raca_form_field_state.dart';
import 'package:projeto_tcc/repositories/raca_repository.dart';
import 'package:projeto_tcc/repositories/raca_repository_mock.dart';

class PetRacaFormFieldController {
  final RacaRepository racaRepository = RacaRepositoryMock();
  Function(PetRacaFormFieldState state)? onListen;
  PetRacaFormFieldState state = PetRacaFormFieldStateEmpty();

  getRacas(String tipoAnimal, String nomeRaca) async {
    update(PetRacaFormFieldStateLoading());
    try {
      final List<RacaModel> racas = 
        tipoAnimal == "c" 
        ? await racaRepository.getRacasCaninas(nomeRaca) 
        : await racaRepository.getRacasFelinas(nomeRaca);
      update(PetRacaFormFieldStateSuccess(racas: racas));
    } catch (e) {
      update(PetRacaFormFieldStateFailure(message: e.toString()));
    }
  }

  void update(PetRacaFormFieldState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(PetRacaFormFieldState state) onFunction) {
    onListen = onFunction;
  }
}