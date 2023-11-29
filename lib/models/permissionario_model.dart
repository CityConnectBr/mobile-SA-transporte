import 'package:sa_transportes_mobile/models/alvara_model.dart';
import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:sa_transportes_mobile/models/modalidade_model.dart';
import 'package:intl/intl.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';

class Permissionario {
  int? id;
  String? nome;
  String? tipo;
  String? rg;
  String? inscricaoMunicipal; //inscricao_municipal
  String? ddd;
  String? telefone;
  String? telefone2;
  String? celular;
  String? email;
  DateTime? dataNascimento;
  String? naturalidade;
  String? nacionalidade;
  String? cnh;
  String? prefixo;
  String? categoriaCNH; //categoria_cnh
  DateTime? vencimentoCNH; //vencimento_cnh
  String? cpfCnpj;
  int? statusFoto;
  String? fotoUrl;
  Modalidade? modalidade;
  Endereco? endereco;
  Veiculo? veiculo;
  Alvara? alvara;
  String? ativo;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Permissionario.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome_razao_social"];
    tipo = parsedJson["tipo"];
    rg = parsedJson["rg"];
    cpfCnpj = parsedJson["cpf_cnpj"];
    inscricaoMunicipal = parsedJson["inscricao_municipal"];
    ddd = parsedJson["ddd"];
    telefone = parsedJson["telefone"];
    telefone2 = parsedJson["telefone2"];
    celular = parsedJson["celular"];
    email = parsedJson["email"];
    dataNascimento = parsedJson["data_nascimento"]!=null?dateFormat.parse(parsedJson["data_nascimento"]):null;
    naturalidade = parsedJson["naturalidade"];
    nacionalidade = parsedJson["nacionalidade"];
    cnh = parsedJson["cnh"];
    categoriaCNH = parsedJson["categoria_cnh"];
    vencimentoCNH = parsedJson["vencimento_cnh"]!=null?dateFormat.parse(parsedJson["vencimento_cnh"]):null;
    statusFoto = parsedJson["status_foto"];
    prefixo = parsedJson["prefixo"];
    fotoUrl = parsedJson["foto_url"];
    ativo = parsedJson["ativo"].toString();
    modalidade = parsedJson["modalidade"]!=null?Modalidade.fromJson(parsedJson["modalidade"]):null;
    endereco = parsedJson["endereco"]!=null?Endereco.fromJson(parsedJson["endereco"]):null;
    veiculo = parsedJson["veiculo"]!=null?Veiculo.fromJson(parsedJson["veiculo"]):null;
    alvara = parsedJson["last_alvara"]!=null?Alvara.fromJson(parsedJson["last_alvara"]):null;
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
      "data_nascimento": dataNascimento!=null?dateFormat.format(dataNascimento!):null,
      "naturalidade": naturalidade,
      "nacionalidade": nacionalidade,
      "cnh": cnh,
      "prefixo": prefixo,
      "categoria_cnh": categoriaCNH,
      "vencimento_cnh": vencimentoCNH!=null?dateFormat.format(vencimentoCNH!):null,
      "status_foto": statusFoto,
      "foto_url": fotoUrl,
      "endereco": endereco!=null?endereco?.toMap():null,
      "veiculo": veiculo!=null?veiculo?.toMap():null,
    };
  }
}