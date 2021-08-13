import 'package:projeto_tcc/models/animal_model.dart';

abstract class MeusPetsState {}

class MeusPetsStateEmpty extends MeusPetsState {}

class MeusPetsStateLoading extends MeusPetsState {}

class MeusPetsStateFailure extends MeusPetsState {
  final String message;
  MeusPetsStateFailure({
    required this.message,
  });
}

class MeusPetsStateSuccess extends MeusPetsState {
  final List<AnimalModel> animais; 
  MeusPetsStateSuccess({
    required this.animais,
  });
}
