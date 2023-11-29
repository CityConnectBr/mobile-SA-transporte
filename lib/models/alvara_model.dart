import 'package:intl/intl.dart';

class Alvara {
  int? id;
  DateTime? dataVencimento;
  String? status;
  String? chavePix;
  String? codigoPix;
  String? valor;
  String? empresaNome;
  String? municipio;

  Alvara();

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Alvara.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    dataVencimento = parsedJson["data_vencimento"] != null
        ? dateFormat.parse(parsedJson["data_vencimento"])
        : null;
    status = parsedJson["status"];
    chavePix = parsedJson["chave_pix"];
    codigoPix = parsedJson["codigo_pix"];
    valor = parsedJson["valor"].toString();
    empresaNome = parsedJson["empresa"];
    municipio = parsedJson["municipio"];
  }

  isExpired() {
    if (dataVencimento == null) return true;
    return dataVencimento!.isBefore(DateTime.now());
  }

  isPayPending() {
    return status == "pendente";
  }

  isWaitingApproval() {
    return status == "confirmacao_pendente";
  }
}
