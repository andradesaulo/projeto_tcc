import 'package:projeto_tcc/models/user_model.dart';

abstract class CadastroUserState {}

class CadastroUserStateEmpty extends CadastroUserState {}

class CadastroUserStateLoading extends CadastroUserState {}

class CadastroUserStateFailure extends CadastroUserState {
  String message;
  CadastroUserStateFailure({
    required this.message,
  });
}

class CadastroUserStateSuccess extends CadastroUserState {
  final UserModel? user;
  CadastroUserStateSuccess({
    required this.user,
  });
}
