class RacaModel {
  int id;
  String nome;
  String tipo;
  
  RacaModel({
    required this.id,
    required this.nome,
    required this.tipo,
  });

  @override
  String toString() {
    return "$id,$nome,$tipo";
  }
}
