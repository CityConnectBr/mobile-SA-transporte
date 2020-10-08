import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class CorVeiculo {
  int id;
  String descricao;

  CorVeiculo();

  CorVeiculo.fromJson(Map<String, dynamic> parsedJson) {
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