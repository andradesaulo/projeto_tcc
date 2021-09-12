class UserExistenteException implements Exception {
  final String? message;

  UserExistenteException({
    this.message = "Este usuário já existe",
  });

  @override
  String toString() {
    return message!;  
  }
}