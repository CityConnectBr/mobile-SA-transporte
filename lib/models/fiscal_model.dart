import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class Fiscal {
  int id;
  String nome;
  String cpf;
  String rg;
  String ddd;
  String telefone;
  String email;
  String cargo;
  Endereco endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Fiscal();

  Fiscal.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.rg = parsedJson["rg"];
    this.cpf = parsedJson["cpf"];
    this.ddd = parsedJson["ddd"];
    this.telefone = parsedJson["telefone"];
    this.email = parsedJson["email"];
    this.cargo = parsedJson["cargo"];
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