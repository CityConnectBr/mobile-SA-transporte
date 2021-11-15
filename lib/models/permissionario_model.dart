import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:sa_transportes_mobile/models/modalidade_model.dart';
import 'package:intl/intl.dart';

class Permissionario {
  int id;
  String nome;
  String tipo;
  String rg;
  String inscricaoMunicipal; //inscricao_municipal
  String ddd;
  String telefone;
  String telefone2;
  String celular;
  String email;
  DateTime dataNascimento;
  String naturalidade;
  String nacionalidade;
  String cnh;
  String categoriaCNH; //categoria_cnh
  DateTime vencimentoCNH; //vencimento_cnh
  String cpfCnpj;
  int statusFoto;
  String fotoUrl;
  Modalidade modalidade;
  Endereco endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Permissionario.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.tipo = parsedJson["tipo"];
    this.rg = parsedJson["rg"];
    this.cpfCnpj = parsedJson["cpf_cnpj"];
    this.inscricaoMunicipal = parsedJson["inscricao_municipal"];
    this.ddd = parsedJson["ddd"];
    this.telefone = parsedJson["telefone"];
    this.telefone2 = parsedJson["telefone2"];
    this.celular = parsedJson["celular"];
    this.email = parsedJson["email"];
    this.dataNascimento = parsedJson["data_nascimento"]!=null?dateFormat.parse(parsedJson["data_nascimento"]):null;
    this.naturalidade = parsedJson["naturalidade"];
    this.nacionalidade = parsedJson["nacionalidade"];
    this.cnh = parsedJson["cnh"];
    this.categoriaCNH = parsedJson["categoria_cnh"];
    this.vencimentoCNH = parsedJson["vencimento_cnh"]!=null?dateFormat.parse(parsedJson["vencimento_cnh"]):null;
    this.statusFoto = parsedJson["status_foto"];
    this.fotoUrl = parsedJson["foto_url"];
    this.modalidade = parsedJson["modalidade"]!=null?Modalidade.fromJson(parsedJson["modalidade"]):null;
    this.endereco = parsedJson["endereco"]!=null?Endereco.fromJson(parsedJson["endereco"]):null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "tipo": tipo,
      "rg": rg,
      "inscricao_municipal": inscricaoMunicipal,
      "ddd": ddd,
      "telefone": telefone,
      "telefone2": telefone2,
      "celular": celular,
      "email": email,
      "data_nascimento": dataNascimento!=null?dateFormat.format(dataNascimento):null,
      "naturalidade": naturalidade,
      "nacionalidade": nacionalidade,
      "cnh": cnh,
      "categoria_cnh": categoriaCNH,
      "vencimento_cnh": vencimentoCNH!=null?dateFormat.format(vencimentoCNH):null,
      "status_foto": statusFoto,
      "foto_url": fotoUrl,
      "endereco": endereco!=null?endereco.toMap():null,
    };
  }
}