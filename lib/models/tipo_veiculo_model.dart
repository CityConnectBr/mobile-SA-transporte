import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class TipoVeiculo {
  int id;
  String descricao;
  String modalidade_transporte;
  int idade_limite_ingresso;
  int idade_limite_permanencia;

  TipoVeiculo();

  TipoVeiculo.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.descricao = parsedJson["descricao"];
    this.modalidade_transporte = parsedJson["modalidade_transporte"];
    this.idade_limite_ingresso = parsedJson["idade_limite_ingresso"];
    this.idade_limite_permanencia = parsedJson["idade_limite_permanencia"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
      "modalidade_transporte": modalidade_transporte,
      "idade_limite_ingresso": idade_limite_ingresso,
      "idade_limite_permanencia": idade_limite_permanencia,
    };
  }
}