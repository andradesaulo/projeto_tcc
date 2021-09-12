import 'package:projeto_tcc/models/user_model.dart';
import 'package:projeto_tcc/pages/login/login_state.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/repositories/user_repository_mock.dart';
import 'package:projeto_tcc/exceptions/user_inexistente_exception.dart';

class LoginController{
  final UserRepository userRepository = UserRepositoryMock();
  Function(LoginState state)? onListen;
  LoginState state = LoginStateEmpty();

  getUser(String nome) async {
    update(LoginStateLoading());
    try {
      final UserModel? user = await userRepository.getUser(nome);
      update(LoginStateSuccess(user: user));
    } on UserInexistenteException catch (e) {
      update(LoginStateFailure(message: e.toString()));
    } catch(e) {
      update(LoginStateFailure(message: e.toString()));
    }
  }

  void update(LoginState state) {
    this.state = state;
    if(onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(LoginState state) onFunction) {
    onListen = onFunction;
  }
}
