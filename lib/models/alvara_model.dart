import 'package:intl/intl.dart';

class Alvara {
  int? id;
  DateTime? dataVencimento;

  Alvara();

  final dateFormat = new DateFormat("yyyy-MM-dd");

  Alvara.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    dataVencimento = parsedJson["data_vencimento"]!=null?dateFormat.parse(parsedJson["data_vencimento"]):null;
  }

  isExpired() {
    if (dataVencimento == null) return true;
    return dataVencimento!.isBefore(DateTime.now());
  }
}