import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class TipoCombustivel {
  int id;
  String descricao;

  TipoCombustivel();

  TipoCombustivel.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.descricao = parsedJson["descricao"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
    };
  }
}