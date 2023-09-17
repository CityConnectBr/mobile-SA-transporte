import 'package:sa_transportes_mobile/models/ponto_model.dart';

class PontoDoPermissionario {
  int? id;
  Ponto? ponto;

  PontoDoPermissionario();

  PontoDoPermissionario.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    ponto = Ponto.fromJson(parsedJson["ponto"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ponto": ponto?.toMap(),
    };
  }
}
