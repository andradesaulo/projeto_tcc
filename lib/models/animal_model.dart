
import 'package:projeto_tcc/models/raca_model.dart';

class AnimalModel {
  int id;
  int idUser;
  RacaModel raca;
  String nome;
  String sexo;
  int? anoNasc;
  String? problemasSaude;
  double? peso;
  int? altura;

  AnimalModel({
    required this.id,
    required this.idUser,
    required this.raca,
    required this.nome,
    required this.sexo,
    required this.anoNasc,
    required this.problemasSaude,
    required this.peso,
    required this.altura,
  });

  @override
  String toString() {
    return "$id,$idUser,${raca.toString()},$nome,$sexo,$anoNasc,$problemasSaude,$peso,$altura";
  }
}
