import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class Fiscal {
  int? id;
  String? nome;
  String? cpf;
  String? rg;
  String? ddd;
  String? telefone;
  String? email;
  String? cargo;
  Endereco? endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Fiscal();

  Fiscal.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
    rg = parsedJson["rg"];
    cpf = parsedJson["cpf"];
    ddd = parsedJson["ddd"];
    telefone = parsedJson["telefone"];
    email = parsedJson["email"];
    cargo = parsedJson["cargo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "cpf": cpf,
      "rg": rg,
      "ddd": ddd,
      "telefone": telefone,
      "email": email,
      "cargo": cargo,
    };
  }
}