import 'package:intl/intl.dart';

class Modalidade {
  int? id;
  String? identificador;
  String? descricao;
  int? limite;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Modalidade.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    identificador = parsedJson["identificador"];
    descricao = parsedJson["descricao"];
    limite= parsedJson["limite"];
  }

}
