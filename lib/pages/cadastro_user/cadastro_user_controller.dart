import 'package:projeto_tcc/models/user_model.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/repositories/user_repository_sqlite.dart';
import 'package:sqflite/sqflite.dart';
import 'cadastro_user_state.dart';

class CadastroUserController {
  final UserRepository userRepository = UserRepositoryMock();
  Function(CadastroUserState state)? onListen;
  CadastroUserState state = CadastroUserStateEmpty();

  createAndGetUser(String nome, DateTime? dataNasc, String? genero) async {
    update(CadastroUserStateLoading());
    try {
      final UserModel user = await userRepository.createAndGetUser(nome, dataNasc, genero);
      update(CadastroUserStateSuccess(user: user));
    } on DatabaseException catch (e){
      if (e.isUniqueConstraintError()) {
        update(CadastroUserStateFailure(message: "Usuário já existente"));
      }
    } catch (e) {
      update(CadastroUserStateFailure(message: "Erro no banco de dados"));
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