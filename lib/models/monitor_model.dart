import 'package:cityconnect/models/endereco_model.dart';
import 'package:cityconnect/models/permissionario_model.dart';
import 'package:intl/intl.dart';

class Monitor {
  int id;
  String nome;
  String cpf;
  String rg;
  String ddd;
  String telefone;
  String email;
  DateTime dataNascimento;
  int statusFoto;
  String fotoUrl;
  Permissionario permissionario;
  Endereco endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Monitor();

  Monitor.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.rg = parsedJson["rg"];
    this.cpf = parsedJson["cpf"];
    this.ddd = parsedJson["ddd"];
    this.telefone = parsedJson["telefone"];
    this.email = parsedJson["email"];
    this.dataNascimento = parsedJson["data_nascimento"]!=null?dateFormat.parse(parsedJson["data_nascimento"]):null;
    this.statusFoto = parsedJson["status_foto"];
    this.fotoUrl = parsedJson["foto_url"];
    this.permissionario = parsedJson["permissionario"]!=null?Permissionario.fromJson(parsedJson["permissionario"]):null;
    this.endereco = parsedJson["endereco"]!=null?Endereco.fromJson(parsedJson["endereco"]):null;
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
      "data_nascimento": dataNascimento!=null?dateFormat.format(dataNascimento):null,
      "status_foto": statusFoto,
      "foto_url": fotoUrl,
      "endereco": endereco!=null?endereco.toMap():null,
      "permissionario": permissionario!=null?permissionario.toMap():null,
    };
  }
}