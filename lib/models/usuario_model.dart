
import 'package:cityconnect/models/permissionario_model.dart';

class Usuario {

  int id;
  String nome;
  String email;
  String cpfCnpj;
  String cnh;
  String password;
  TipoDoUsuario tipo;
  Permissionario permissionario;

  Usuario({int id, String nome, String email, String cpf, String cnh, String password}){
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.cpfCnpj = cpf;
    this.cnh = cnh;
    this.password = password;
  }

  Usuario.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.email = parsedJson["email"];
    this.cpfCnpj = parsedJson["cpf_cnpj"];
    this.cnh = parsedJson["cnh"];
    this.tipo = TipoDoUsuario.fromJson(parsedJson["tipo"]);
    this.permissionario = parsedJson["permissionario"]!=null?Permissionario.fromJson(parsedJson["permissionario"]):null;
  }

  Map<String, dynamic> toMap(){
    print(this.permissionario.toMap());
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "cpf_cnpj": cpfCnpj,
      "cnh": cnh,
      "permissionario": this.permissionario.toMap(),
    };
  }

}

class TipoDoUsuario{
  int id;
  String nome;

  TipoDoUsuario.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
  }

}