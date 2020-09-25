import 'package:intl/intl.dart';

class Endereco {
  int id;
  String cep;
  String endereco;
  String numero;
  String complemento;
  String bairro;
  String municipio;
  String uf;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Endereco();

  Endereco.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.cep = parsedJson["cep"];
    this.endereco = parsedJson["endereco"];
    this.numero = parsedJson["numero"];
    this.complemento = parsedJson["complemento"];
    this.bairro = parsedJson["bairro"];
    this.municipio = parsedJson["municipio"];
    this.uf = parsedJson["uf"];
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
