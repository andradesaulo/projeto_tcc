import 'package:projeto_tcc/models/afericao_model.dart';
import 'package:projeto_tcc/pages/pet/pet_afericao/pet_afericao_state.dart';
import 'package:projeto_tcc/repositories/afericao_repository.dart';
import 'package:projeto_tcc/repositories/afericao_repository_sqlite.dart';

class PetAfericaoController {
  final AfericaoRepository afericaoRepository = AfericaoRepositoryMock();
  Function(PetAfericaoState state)? onListen;
  PetAfericaoState state = PetAfericaoStateEmpty();

  getAfericoes({required int idAnimal, DateTime? dataInicio, DateTime? dataFim}) async {
    update(PetAfericaoStateLoading());
    try {
      final List<AfericaoModel> afericoesEncontradas = await afericaoRepository.getAfericoes(idAnimal: idAnimal, dataInicio: dataInicio, dataFim: dataFim);
      update(PetAfericaoStateSuccess(afericoes: afericoesEncontradas));
    } catch (e) {
      update(PetAfericaoStateFailure(message: e.toString()));
    }

  }

  void update(PetAfericaoState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(PetAfericaoState state) onFunction) {
    onListen = onFunction;
  }
}