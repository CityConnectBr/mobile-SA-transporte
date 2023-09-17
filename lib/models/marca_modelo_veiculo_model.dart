import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class MarcaModeloVeiculo {
  int? id;
  String? descricao;

  MarcaModeloVeiculo();

  MarcaModeloVeiculo.fromJson(Map<String, dynamic> parsedJson) {
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