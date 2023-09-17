
class CategoriaVeiculo {
  int? id;
  String? nome;

  CategoriaVeiculo();

  CategoriaVeiculo.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": nome,
    };
  }
}