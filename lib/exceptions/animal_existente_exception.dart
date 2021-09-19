class AnimalExistenteException implements Exception {
  final String? message;

  AnimalExistenteException({
    this.message = "Este animal já existe",
  });

  @override
  String toString() {
    return message!;  
  }
}