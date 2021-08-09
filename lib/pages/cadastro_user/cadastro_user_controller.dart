import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/repositories/user_repository_mock.dart';
import 'cadastro_user_state.dart';

class CadastroUserController {
  final UserRepository userRepository = UserRepositoryMock();
  Function(CadastroUserState state)? onListen;
  CadastroUserState state = CadastroUserStateEmpty();

  setAndGetUser(String nome, DateTime? dataNasc, String? genero) async {
    update(CadastroUserStateLoading());
    try {
      final setUserSucceeded = await userRepository.setUser(nome, dataNasc, genero);
      if(setUserSucceeded) {
        final user = await userRepository.getUser(nome);
        update(CadastroUserStateSuccess(user: user));
      } else {
        update(CadastroUserStateFailure(message: "Este nome de usuário já existe"));
      }
    } catch (e) {
      update(CadastroUserStateFailure(message: e.toString()));
    }
  }

  void update(CadastroUserState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(CadastroUserState state) onFunction) {
    onListen = onFunction;
  }
}