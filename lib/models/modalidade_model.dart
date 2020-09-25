import 'package:intl/intl.dart';

class Modalidade {
  int id;
  String identificador;
  String descricao;
  int limite;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Modalidade.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.identificador = parsedJson["identificador"];
    this.descricao = parsedJson["descricao"];
    this.limite= parsedJson["limite"];
  }

}
