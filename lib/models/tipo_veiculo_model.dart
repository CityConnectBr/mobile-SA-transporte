
class TipoVeiculo {
  int? id;
  String? descricao;
  String? modalidade_transporte;
  int? idade_limite_ingresso;
  int? idade_limite_permanencia;

  TipoVeiculo();

  TipoVeiculo.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    descricao = parsedJson["descricao"];
    modalidade_transporte = parsedJson["modalidade_transporte"];
    idade_limite_ingresso = parsedJson["idade_limite_ingresso"];
    idade_limite_permanencia = parsedJson["idade_limite_permanencia"];
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