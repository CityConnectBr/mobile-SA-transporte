import 'package:intl/intl.dart';

class Endereco {
  int? id;
  String? cep;
  String? endereco;
  String? numero;
  String? complemento;
  String? bairro;
  String? municipio;
  String? uf;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Endereco();

  Endereco.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    cep = parsedJson["cep"];
    endereco = parsedJson["endereco"];
    numero = parsedJson["numero"];
    complemento = parsedJson["complemento"];
    bairro = parsedJson["bairro"];
    municipio = parsedJson["municipio"];
    uf = parsedJson["uf"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "cep": cep,
      "endereco": endereco,
      "numero": numero,
      "complemento": complemento,
      "bairro": bairro,
      "municipio": municipio,
      "uf": uf,
    };
  }
}
