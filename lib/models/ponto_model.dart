class Ponto {
  int? id;
  String? descricao;
  int? permissionarioId;
  String? permissionarioNome;

  Ponto();

  Ponto.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    descricao = parsedJson["descricao"];
  }

  Ponto.fromJsonPontoPermissionario(Map<String, dynamic> parsedJson) {
    id = parsedJson["ponto"]["id"];
    descricao = parsedJson["ponto"]["descricao"];
    permissionarioId = parsedJson["permissionario"]["id"];
    permissionarioNome = parsedJson["permissionario"]["nome_razao_social"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
    };
  }
}
