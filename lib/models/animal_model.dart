
class AnimalModel {
  final int id;
  final int idUser;
  final int idRaca;
  final String nomeRaca;
  final String tipo;
  final String nome;
  final String sexo;
  final int? idade;
  final String? problemasSaude;
  final double? peso;
  final double? altura;

  AnimalModel({
    required this.id,
    required this.idUser,
    required this.idRaca,
    required this.nomeRaca,
    required this.tipo,
    required this.nome,
    required this.sexo,
    this.idade,
    this.problemasSaude,
    this.peso,
    this.altura,
  });
}
