import 'package:projeto_tcc/pages/login/login_state.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/repositories/user_repository_mock.dart';

class LoginController {
  late UserRepository userRepository;
  Function(LoginState state)? onListen;
  LoginState state = LoginStateEmpty();
  
  LoginController(){
    this.userRepository = UserRepositoryMock();
  }

  getUser(String nome) async {
    update(LoginStateLoading());
    try {
      final user = await userRepository.getUser(nome);
      update(LoginStateSuccess(user: user));
    } catch (e) {
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
