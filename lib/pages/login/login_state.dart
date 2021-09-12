import 'package:projeto_tcc/models/user_model.dart';

abstract class LoginState {}

class LoginStateEmpty extends LoginState {}
class LoginStateLoading extends LoginState {}

class LoginStateFailure extends LoginState {
  String message;
  LoginStateFailure({
    required this.message,
  });
}

class LoginStateSuccess extends LoginState {
  final UserModel? user;
  LoginStateSuccess({
    required this.user,
  });
}
