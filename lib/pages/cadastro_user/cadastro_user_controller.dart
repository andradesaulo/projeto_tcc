import 'package:projeto_tcc/exceptions/user_existente_exception.dart';
import 'package:projeto_tcc/exceptions/user_inexistente_exception.dart';
import 'package:projeto_tcc/models/user_model.dart';
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
      final UserModel? user = await userRepository.setAndGetUser(nome, dataNasc, genero);
      update(CadastroUserStateSuccess(user: user));
    } on UserExistenteException catch (e){
      update(CadastroUserStateFailure(message: e.toString()));
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