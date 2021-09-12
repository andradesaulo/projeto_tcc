class RacaInexistenteException implements Exception {
  final String? message;

  RacaInexistenteException({
    this.message = "Nenhuma raça encontrada",
  });

  @override
  String toString() {
    return message!;  
  }
}