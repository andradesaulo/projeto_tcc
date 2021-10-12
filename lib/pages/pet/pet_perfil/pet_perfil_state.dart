abstract class PetPerfilState {}

class PetPerfilStateEmpty extends PetPerfilState {}

class PetPerfilStateLoading extends PetPerfilState {}

class PetPerfilStateSuccess extends PetPerfilState {}

class PetPerfilStateFailure extends PetPerfilState {
  final String message;
  PetPerfilStateFailure({
    required this.message,
  });
}
