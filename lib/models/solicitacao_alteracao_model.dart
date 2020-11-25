import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class SolicitacaoDeAlteracao {
  int id;
  String referenciaId;//referencia_id
  String motivoRecusado;//motivo_recusado
  bool sincronizado;
  String status;
  String campo1;
  String campo2;
  String campo3;
  String campo4;
  String campo5;
  String campo6;
  String campo7;
  String campo8;
  String campo9;
  String campo10;
  String campo11;
  String campo12;
  String campo13;
  String campo14;
  String campo15;
  String campo16;
  String campo17;
  String campo18;
  String campo19;
  String campo20;
  String arquivo1;
  String arquivo2;
  String arquivo3;
  String arquivo4;
  String tipoSolicitacaoId;//tipo_solicitacao_id

  SolicitacaoDeAlteracao();

  SolicitacaoDeAlteracao.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.motivoRecusado = parsedJson["motivo_recusado"];
    this.sincronizado = parsedJson["sincronizado"]==0;
    this.campo1 = parsedJson["campo1"];
    this.campo2 = parsedJson["campo2"];
    this.campo3 = parsedJson["campo3"];
    this.campo4 = parsedJson["campo4"];
    this.campo5 = parsedJson["campo5"];
    this.campo6 = parsedJson["campo6"];
    this.campo7 = parsedJson["campo7"];
    this.campo8 = parsedJson["campo8"];
    this.campo9 = parsedJson["campo9"];
    this.campo10 = parsedJson["campo10"];
    this.campo11 = parsedJson["campo11"];
    this.campo12 = parsedJson["campo12"];
    this.campo13 = parsedJson["campo13"];
    this.campo14 = parsedJson["campo14"];
    this.campo15 = parsedJson["campo15"];
    this.campo16 = parsedJson["campo16"];
    this.campo17 = parsedJson["campo17"];
    this.campo18 = parsedJson["campo18"];
    this.campo19 = parsedJson["campo19"];
    this.campo20 = parsedJson["campo20"];
    this.arquivo1 = parsedJson["arquivo1"];
    this.arquivo2 = parsedJson["arquivo2"];
    this.arquivo3 = parsedJson["arquivo3"];
    this.arquivo4 = parsedJson["arquivo4"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "referencia_id": referenciaId,
      "motivo_recusado": motivoRecusado,
      "sincronizado": sincronizado,
      "campo1": campo1,
      "campo2": campo2,
      "campo3": campo3,
      "campo4": campo4,
      "campo5": campo5,
      "campo6": campo6,
      "campo7": campo7,
      "campo8": campo8,
      "campo9": campo9,
      "campo10": campo10,
      "campo11": campo11,
      "campo12": campo12,
      "campo13": campo13,
      "campo14": campo14,
      "campo15": campo15,
      "campo16": campo16,
      "campo17": campo17,
      "campo18": campo18,
      "campo19": campo19,
      "campo20": campo20,
      "arquivo1": arquivo1,
      "arquivo2": arquivo2,
      "arquivo3": arquivo3,
      "arquivo4": arquivo4,
    };
  }
}