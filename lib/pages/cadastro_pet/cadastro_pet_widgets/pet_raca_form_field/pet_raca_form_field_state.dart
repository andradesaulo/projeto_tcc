import 'package:projeto_tcc/models/raca_model.dart';

abstract class PetRacaFormFieldState {}

class PetRacaFormFieldStateEmpty extends PetRacaFormFieldState {}

class PetRacaFormFieldStateLoading extends PetRacaFormFieldState {}

class PetRacaFormFieldStateFailure extends PetRacaFormFieldState {
  String message;
  PetRacaFormFieldStateFailure({
    required this.message,
  });
}

class PetRacaFormFieldStateSuccess extends PetRacaFormFieldState {
  final List<RacaModel> racas;
  PetRacaFormFieldStateSuccess({
    required this.racas,
  });
}