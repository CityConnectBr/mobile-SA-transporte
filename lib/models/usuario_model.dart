import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/fiscal_model.dart';
import 'package:sa_transportes_mobile/models/permissionario_model.dart';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? cpfCnpj;
  String? cnh;
  String? password;
  TipoDoUsuario? tipo;
  Permissionario? permissionario;
  Condutor? condutor;
  Fiscal? fiscal;

  Usuario(
      {this.id, this.nome, this.email, this.cpfCnpj, this.cnh, this.password});

  Usuario.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
    email = parsedJson["email"];
    cpfCnpj = parsedJson["cpf_cnpj"];
    cnh = parsedJson["cnh"];
    tipo = TipoDoUsuario.fromJson(parsedJson["tipo"]);
    permissionario = parsedJson["permissionario"] != null
        ? Permissionario.fromJson(parsedJson["permissionario"])
        : null;
    fiscal = parsedJson["fiscal"] != null
        ? Fiscal.fromJson(parsedJson["fiscal"])
        : null;
    condutor = parsedJson["condutor"] != null
        ? Condutor.fromJson(parsedJson["condutor"])
        : null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "cpf_cnpj": cpfCnpj,
      "cnh": cnh,
      "permissionario": permissionario != null ? permissionario?.toMap() : null,
      "fiscal": fiscal != null ? fiscal?.toMap() : null,
      "condutor": condutor != null ? condutor?.toMap() : null,
    };
  }
}

class TipoDoUsuario {
  int? id;
  String? nome;

  TipoDoUsuario.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
  }
}
