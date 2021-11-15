import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class CategoriaVeiculo {
  int id;
  String nome;

  CategoriaVeiculo();

  CategoriaVeiculo.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": nome,
    };
  }
}