import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class MarcaModeloChassi {
  int? id;
  String? descricao;
  String? modelo;

  MarcaModeloChassi();

  MarcaModeloChassi.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    descricao = parsedJson["descricao"];
    descricao = parsedJson["modelo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
      "modelo": modelo,
    };
  }
}