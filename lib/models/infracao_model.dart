import 'package:intl/intl.dart';

class Infracao {
  String id;
  String chavePix;
  String codigoInfracao;
  DateTime dataInfracao;
  String descricaoInfracao;
  String empresaNome;
  String municipio;
  String cep;
  String status;
  String valor;

  final dateFormat = DateFormat("yyyy-MM-dd");

  Infracao.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"].toString();
    chavePix = parsedJson["chave_pix"].toString();
    codigoInfracao = parsedJson["codigo_infracao"].toString();
    dataInfracao = parsedJson["data_infracao"] != null
        ? dateFormat.parse(parsedJson["data_infracao"])
        : null;
    descricaoInfracao = parsedJson["descricao"];
    empresaNome = parsedJson["empresa"];
    municipio = parsedJson["municipio"];
    cep = parsedJson["cep"].toString();
    status = parsedJson["status"];
    valor = parsedJson["valor_final"].toString();
  }

  toMap() {
    return {
      "id": id,
      "chave_pix": chavePix,
      "codigo_infracao": codigoInfracao,
      "data_infracao":
          dataInfracao != null ? dateFormat.format(dataInfracao) : null,
      "descricao": descricaoInfracao,
      "empresa": empresaNome,
      "municipio": municipio,
      "cep": cep,
      "status": status,
      "valor_final": valor,
    };
  }
}
