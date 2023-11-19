import 'package:sa_transportes_mobile/models/tipo_solicitacao_model.dart';
import 'package:sa_transportes_mobile/util/util.dart';

class SolicitacaoDeAlteracao {
  int? id;
  String? referenciaId;//referencia_id
  String? motivoRecusado;//motivo_recusado
  bool? sincronizado;
  String? status;
  String? campo1;
  String? campo2;
  String? campo3;
  String? campo4;
  String? campo5;
  String? campo6;
  String? campo7;
  String? campo8;
  String? campo9;
  String? campo10;
  String? campo11;
  String? campo12;
  String? campo13;
  String? campo14;
  String? campo15;
  String? campo16;
  String? campo17;
  String? campo18;
  String? campo19;
  String? campo20;
  String? arquivo1;
  String? arquivo2;
  String? arquivo3;
  String? arquivo4;
  String? arquivo5;
  String? arquivo6;
  String? arquivo7;
  String? arquivo8;
  String? arquivo9;
  String? arquivo10;
  String? tipoSolicitacaoId;//tipo_solicitacao_id
  TipoSolicitacao? tipoSolicitacao;
  DateTime? createdAt;

  SolicitacaoDeAlteracao();

  SolicitacaoDeAlteracao.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    motivoRecusado = parsedJson["motivo_recusado"];
    sincronizado = parsedJson["sincronizado"]==0;
    status = parsedJson["status"];
    campo1 = parsedJson["campo1"];
    campo2 = parsedJson["campo2"];
    campo3 = parsedJson["campo3"];
    campo4 = parsedJson["campo4"];
    campo5 = parsedJson["campo5"];
    campo6 = parsedJson["campo6"];
    campo7 = parsedJson["campo7"];
    campo8 = parsedJson["campo8"];
    campo9 = parsedJson["campo9"];
    campo10 = parsedJson["campo10"];
    campo11 = parsedJson["campo11"];
    campo12 = parsedJson["campo12"];
    campo13 = parsedJson["campo13"];
    campo14 = parsedJson["campo14"];
    campo15 = parsedJson["campo15"];
    campo16 = parsedJson["campo16"];
    campo17 = parsedJson["campo17"];
    campo18 = parsedJson["campo18"];
    campo19 = parsedJson["campo19"];
    campo20 = parsedJson["campo20"];
    arquivo1 = parsedJson["arquivo1"];
    arquivo2 = parsedJson["arquivo2"];
    arquivo3 = parsedJson["arquivo3"];
    arquivo4 = parsedJson["arquivo4"];
    arquivo5 = parsedJson["arquivo5"];
    arquivo6 = parsedJson["arquivo6"];
    arquivo7 = parsedJson["arquivo7"];
    arquivo8 = parsedJson["arquivo8"];
    arquivo9 = parsedJson["arquivo9"];
    arquivo10 = parsedJson["arquivo10"];
    tipoSolicitacao = parsedJson["tipo"]!=null?TipoSolicitacao.fromJson(parsedJson["tipo"]):null;
    createdAt = parsedJson["created_at"]!=null?Util.dateFormatyyyyMMddTHHmmssZ.parse(parsedJson["created_at"]):null;
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
      "arquivo5": arquivo5,
      "arquivo6": arquivo6,
      "arquivo7": arquivo7,
      "arquivo8": arquivo8,
      "arquivo9": arquivo9,
      "arquivo10": arquivo10,
    };
  }

  String get statusToShow{
    try{
      if(status==null){
        return "Aguardando";
      }else if(status!.contains("A")){
        return "Aceito";
      }else if(status!.contains("R")){
        return "Recusado";
      }else if(status!.contains("C")){
        return "Cancelado";
      }
    }catch(e){}

    return "Não Definido";
  }
}