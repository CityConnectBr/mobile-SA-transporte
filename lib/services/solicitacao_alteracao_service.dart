import 'dart:io';

import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';
import 'package:dio/dio.dart';

class SolicitacaoDeAlteracaoService extends MainService {
  static const int TIPO_CONDUTOR_CONTATO = 1;
  static const int TIPO_CONDUTOR_ENDERECO = 2;
  static const int TIPO_CONDUTOR_IDENTIDADE = 3;
  static const int TIPO_CONDUTOR_CNH = 4;
  static const int TIPO_CONDUTOR_CADASTRO = 5;
  static const int TIPO_CONDUTOR_FOTO = 6;

  static const int TIPO_PERMISSIONARIO_CONTATO = 10;
  static const int TIPO_PERMISSIONARIO_ENDERECO = 11;
  static const int TIPO_PERMISSIONARIO_IDENTIDADE = 12;
  static const int TIPO_PERMISSIONARIO_CNH = 13;
  static const int TIPO_PERMISSIONARIO_FOTO = 14;

  static const int TIPO_MONITOR_CONTATO = 20;
  static const int TIPO_MONITOR_ENDERECO = 21;
  static const int TIPO_MONITOR_IDENTIDADE = 22;
  static const int TIPO_MONITOR_CADASTRO = 23;
  static const int TIPO_MONITOR_FOTO = 24;

  static const int TIPO_FISCAL_CONTATO = 30;
  static const int TIPO_FISCAL_ENDERECO = 31;
  static const int TIPO_FISCAL_IDENTIDADE = 32;
  static const int TIPO_FISCAL_FOTO = 33;

  static const int TIPO_VEICULO = 40;

  static const int SOLICITACAO_INFRACAO = 60;

  static const int RENOVACAO_ALVARA = 70;

  static const int SUBSTITUICAO_VEICULO_ESCOLAR = 80;

  static const int SUBSTITUICAO_VEICULO_TAXI = 90;

  SolicitacaoDeAlteracaoService() {
    super.endPoint = '/solicitacaodealteracao';
    super.endPointVersion = 1;
  }

  Future<dynamic> createSolicitacao(
      SolicitacaoDeAlteracao solicitacaoDeAlteracao,
      Usuario usuarioLogged) async {
    Map<String, dynamic> formMap = solicitacaoDeAlteracao.toMap();

    for (int i = 1; i <= 10; i++) {
      String? arquivo = solicitacaoDeAlteracao.getArquivo(i);

      if (arquivo != null) {
        File file = File(arquivo);
        formMap["arquivo$i"] = MultipartFile(
          file.openRead(),
          await file.length(),
          filename: "arquivo$i.jpg",
        );
      }
    }

    formMap["tipo_solicitacao_id"] = solicitacaoDeAlteracao.tipoSolicitacaoId;

    await dio.post(
      makeEndPoint(usuario: usuarioLogged),
      data: FormData.fromMap(_removeNulls(formMap)),
    );
  }

  Future<List<SolicitacaoDeAlteracao>> searchForSolicitacoes(int tipo,
      String referencia, bool statusNull, Usuario usuarioLogged) async {
    List<SolicitacaoDeAlteracao> solicitacoesList = [];
    List<dynamic> list = (await dio.get(makeEndPoint(usuario: usuarioLogged),
            queryParameters: {
          "tipo": tipo,
          "referencia": referencia,
          "status": statusNull ? "null" : ""
        }))
        .data['data'];

    if (list != null) {
      list.forEach(
          (e) => solicitacoesList.add(SolicitacaoDeAlteracao.fromJson(e)));
    }

    return solicitacoesList;
  }

  Map<String, dynamic> _removeNulls(Map<String, dynamic> map) {
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
