import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class Condutor {
  int id;
  String nome;
  String cpf;
  String rg;
  String ddd;
  String telefone;
  String celular;
  String email;
  String cnh;
  String categoriaCNH; //categoria_cnh
  DateTime vencimentoCNH; //vencimento_cnh
  Endereco endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Condutor();

  Condutor.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.rg = parsedJson["rg"];
    this.cpf = parsedJson["cpf"];
    this.ddd = parsedJson["ddd"];
    this.telefone = parsedJson["telefone"];
    this.celular = parsedJson["celular"];
    this.email = parsedJson["email"];
    this.cnh = parsedJson["cnh"];
    this.categoriaCNH = parsedJson["categoria_cnh"];
    this.vencimentoCNH = parsedJson["vencimento_cnh"]!=null?dateFormat.parse(parsedJson["vencimento_cnh"]):null;
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
      "celular": celular,
      "email": email,
      "cnh": cnh,
      "categoria_cnh": categoriaCNH,
      "vencimento_cnh": vencimentoCNH!=null?dateFormat.format(vencimentoCNH):null,
      "endereco": endereco!=null?endereco.toMap():null,
    };
  }
}