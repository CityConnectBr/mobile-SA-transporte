import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class CorVeiculo {
  int? id;
  String? descricao;

  CorVeiculo();

  CorVeiculo.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    descricao = parsedJson["descricao"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
    };
  }
}