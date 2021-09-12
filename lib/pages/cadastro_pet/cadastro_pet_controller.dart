import 'package:projeto_tcc/pages/cadastro_pet/cadastro_pet_state.dart';

class CadastroPetController {
  Function(CadastroPetState state)? onListen;
  CadastroPetState state = CadastroPetStateEmpty();

  void update(CadastroPetState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(CadastroPetState state) onFunction) {
    onListen = onFunction;
  }
}