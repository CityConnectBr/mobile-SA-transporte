import 'package:sa_transportes_mobile/models/endereco_model.dart';
import 'package:sa_transportes_mobile/models/permissionario_model.dart';
import 'package:intl/intl.dart';

class Monitor {
  int? id;
  String? nome;
  String? cpf;
  String? rg;
  String? ddd;
  String? telefone;
  String? email;
  DateTime? dataNascimento;
  int? statusFoto;
  String? fotoUrl;
  Permissionario? permissionario;
  Endereco? endereco;

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Monitor();

  Monitor.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    nome = parsedJson["nome"];
    rg = parsedJson["rg"];
    cpf = parsedJson["cpf"];
    ddd = parsedJson["ddd"];
    telefone = parsedJson["telefone"];
    email = parsedJson["email"];
    dataNascimento = parsedJson["data_nascimento"] != null
        ? dateFormat.parse(parsedJson["data_nascimento"])
        : null;
    statusFoto = parsedJson["status_foto"];
    fotoUrl = parsedJson["foto_url"];
    permissionario = parsedJson["permissionario"] != null
        ? Permissionario.fromJson(parsedJson["permissionario"])
        : null;
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
      "email": email,
      "data_nascimento":
          dataNascimento != null ? dateFormat.format(dataNascimento!) : null,
      "status_foto": statusFoto,
      "foto_url": fotoUrl,
      "endereco": endereco != null ? endereco!.toMap() : null,
      "permissionario": permissionario != null ? permissionario!.toMap() : null,
    };
  }
}
