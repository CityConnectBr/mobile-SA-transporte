import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:intl/intl.dart';

class Condutor {
  int? id;
  String? nome;
  String? cpf;
  String? rg;
  String? ddd;
  String? telefone;
  String? celular;
  String? email;
  String? cnh;
  String? categoriaCNH; //categoria_cnh
  DateTime? vencimentoCNH; //vencimento_cnh
  int? statusFoto;
  String? fotoUrl;
  Endereco? endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Condutor();

  Condutor.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
    rg = parsedJson["rg"];
    cpf = parsedJson["cpf"];
    ddd = parsedJson["ddd"];
    telefone = parsedJson["telefone"];
    celular = parsedJson["celular"];
    email = parsedJson["email"];
    cnh = parsedJson["cnh"];
    categoriaCNH = parsedJson["categoria_cnh"];
    vencimentoCNH = parsedJson["vencimento_cnh"] != null
        ? dateFormat.parse(parsedJson["vencimento_cnh"])
        : null;
    statusFoto = parsedJson["status_foto"];
    fotoUrl = parsedJson["foto_url"];
    endereco = parsedJson["endereco"] != null
        ? Endereco.fromJson(parsedJson["endereco"])
        : null;
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
      "vencimento_cnh":
          vencimentoCNH != null ? dateFormat.format(vencimentoCNH!) : null,
      "status_foto": statusFoto,
      "foto_url": fotoUrl,
      "endereco": endereco != null ? endereco!.toMap() : null,
    };
  }
}
