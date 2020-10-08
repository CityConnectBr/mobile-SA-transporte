import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class MarcaModeloVeiculo {
  int id;
  String descricao;

  MarcaModeloVeiculo();

  MarcaModeloVeiculo.fromJson(Map<String, dynamic> parsedJson) {
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