import 'package:projeto_tcc/models/user_model.dart';

abstract class UserRepository{
  Future<UserModel> getUser(String nome);
  Future<bool> setUser(String nome, DateTime? dataNasc, String? genero);
}