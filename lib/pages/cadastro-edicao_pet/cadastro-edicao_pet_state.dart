import 'package:projeto_tcc/models/animal_model.dart';

abstract class CadastroEdicaoPetState {}

class CadastroEdicaoPetStateEmpty extends CadastroEdicaoPetState{}

class CadastroEdicaoPetStateLoading extends CadastroEdicaoPetState{}

class CadastroEdicaoPetStateFailure extends CadastroEdicaoPetState{
  String message;
  CadastroEdicaoPetStateFailure({
    required this.message,
  });
}

class CadastroPetStateSuccess extends CadastroEdicaoPetState{
  final AnimalModel animal;
  CadastroPetStateSuccess({
    required this.animal,
  });
}

class EdicaoPetStateSuccess extends CadastroEdicaoPetState{
  final AnimalModel animal;
  EdicaoPetStateSuccess({
    required this.animal,
  });
}