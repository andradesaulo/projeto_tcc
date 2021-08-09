class UserModel {
  final int id;
  final String nome;
  final DateTime? dataNasc;
  final String? genero;

  UserModel({
    required this.id,
    required this.nome,
    this.dataNasc,
    this.genero,
  });
}