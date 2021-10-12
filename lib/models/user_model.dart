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

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id,
      'nome': nome,
      'data_nasc': dataNasc,
      'genero': genero,
    };
  }

  
}