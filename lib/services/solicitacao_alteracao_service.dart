import 'dart:convert';
import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';

class SolicitacaoDeAlteracaoService extends MainService {
  static final int TIPO_CONDUTOR_CONTATO = 1;
  static final int TIPO_CONDUTOR_ENDERECO = 2;
  static final int TIPO_CONDUTOR_IDENTIDADE = 3;
  static final int TIPO_CONDUTOR_CNH = 4;
  static final int TIPO_CONDUTOR_CADASTRO = 5;
  static final int TIPO_CONDUTOR_FOTO = 6;

  static final int TIPO_PERMISSIONARIO_CONTATO = 10;
  static final int TIPO_PERMISSIONARIO_ENDERECO = 11;
  static final int TIPO_PERMISSIONARIO_IDENTIDADE = 12;
  static final int TIPO_PERMISSIONARIO_CNH = 13;
  static final int TIPO_PERMISSIONARIO_FOTO = 14;

  static final int TIPO_MONITOR_CONTATO = 20;
  static final int TIPO_MONITOR_ENDERECO = 21;
  static final int TIPO_MONITOR_IDENTIDADE = 22;
  static final int TIPO_MONITOR_CADASTRO = 23;
  static final int TIPO_MONITOR_FOTO = 24;

  static final int TIPO_FISCAL_CONTATO = 30;
  static final int TIPO_FISCAL_ENDERECO = 31;
  static final int TIPO_FISCAL_IDENTIDADE = 32;
  static final int TIPO_FISCAL_FOTO = 33;

  static final int TIPO_VEICULO = 40;

  SolicitacaoDeAlteracaoService() {
    super.endPoint = '/solicitacaodealteracao';
    super.endPointVersion = 1;
  }

  Future<dynamic> createSolicitacao(SolicitacaoDeAlteracao solicitacaoDeAlteracao, Usuario usuarioLogged) async {
    Map<String, dynamic> fileMap = solicitacaoDeAlteracao.toMap();

    if (solicitacaoDeAlteracao.arquivo1 != null) {
      File arquivo1 = File(solicitacaoDeAlteracao.arquivo1);
      fileMap["arquivo1"] = MultipartFile(arquivo1.openRead(), await arquivo1.length(), filename: "arquivo1.jpg");
    }

    if (solicitacaoDeAlteracao.arquivo2 != null) {
      File arquivo2 = File(solicitacaoDeAlteracao.arquivo2);
      fileMap["arquivo2"] = MultipartFile(arquivo2.openRead(), await arquivo2.length(), filename: "arquivo2.jpg");
    }

    if (solicitacaoDeAlteracao.arquivo3 != null) {
      File arquivo3 = File(solicitacaoDeAlteracao.arquivo3);
      fileMap["arquivo3"] = MultipartFile(arquivo3.openRead(), await arquivo3.length(), filename: "arquivo3.jpg");
    }

    fileMap["tipo_solicitacao_id"] = solicitacaoDeAlteracao.tipoSolicitacaoId;

    //fileMap.addAll(solicitacaoDeAlteracao.toMap());

    await dio.post(makeEndPoint(usuario: usuarioLogged), data: FormData.fromMap(fileMap));
  }

  Future<List<SolicitacaoDeAlteracao>> searchForSolicitacoes(int tipo, String referencia, bool statusNull, Usuario usuarioLogged) async {
    List<SolicitacaoDeAlteracao> solicitacoesList = List();
    List<dynamic> list =
        (await dio.get(makeEndPoint(usuario: usuarioLogged), queryParameters: {"tipo": tipo, "referencia": referencia, "status": statusNull ? "null" : ""}))
            .data['data'];

    if (list != null) {
      list.forEach((e) => solicitacoesList.add(SolicitacaoDeAlteracao.fromJson(e)));
    }

    return solicitacoesList;
  }
}
