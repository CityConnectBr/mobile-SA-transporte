import 'package:cityconnect/models/endereco_model.dart';
import 'package:intl/intl.dart';

class TipoSolicitacao {
  int id;
  String nome;

  TipoSolicitacao();

  TipoSolicitacao.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
  }

  String get nomeToShow{
    try{
      return nome.replaceAll("_", " / ")
          .replaceAll("endereco", "endereço")
          .replaceAll("permissionario", "permissionário")
          .replaceAll("veiculo", "veículo");
    }catch(e){}

    return nome;
  }

}