class UserInexistenteException implements Exception {
  final String? message;

  UserInexistenteException({
    this.message = "Este usuário não existe",
  });

  @override
  String toString() {
    return message!;  
  }
}
