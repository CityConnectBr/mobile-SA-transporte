
import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/fiscal_model.dart';
import 'package:sa_transportes_mobile/models/permissionario_model.dart';

class Usuario {

  int id;
  String nome;
  String email;
  String cpfCnpj;
  String cnh;
  String password;
  TipoDoUsuario tipo;
  Permissionario permissionario;
  Condutor condutor;
  Fiscal fiscal;

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
    this.fiscal = parsedJson["fiscal"]!=null?Fiscal.fromJson(parsedJson["fiscal"]):null;
    this.condutor = parsedJson["condutor"]!=null?Condutor.fromJson(parsedJson["condutor"]):null;
  }

  Map<String, dynamic> toMap(){
    print(this.permissionario.toMap());
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "cpf_cnpj": cpfCnpj,
      "cnh": cnh,
      "permissionario": this.permissionario!=null?this.permissionario.toMap():null,
      "fiscal": this.fiscal!=null?this.fiscal.toMap():null,
      "condutor": this.condutor!=null?this.condutor.toMap():null,
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