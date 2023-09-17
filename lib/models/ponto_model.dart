
class Ponto {
  int? id;
  String? descricao;

  Ponto();

  Ponto.fromJson(Map<String, dynamic> parsedJson) {
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
