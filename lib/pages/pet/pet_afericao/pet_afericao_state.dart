import 'package:projeto_tcc/models/afericao_model.dart';

abstract class PetAfericaoState {}

class PetAfericaoStateEmpty extends PetAfericaoState {}

class PetAfericaoStateLoading extends PetAfericaoState {}

class PetAfericaoStateSuccess extends PetAfericaoState {
  final List<AfericaoModel> afericoes;
  PetAfericaoStateSuccess({
    required this.afericoes,
  });
}

class PetAfericaoStateFailure extends PetAfericaoState {
  final String message;
  PetAfericaoStateFailure({
    required this.message,
  });
}