import 'dart:convert';
import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';

class SolicitacaoDeAlteracaoService extends MainService {
  SolicitacaoDeAlteracaoService() {
    super.url = '/api/permissionarios/solicitacaodealteracao';
  }

  Future<dynamic> createSolicitacao(SolicitacaoDeAlteracao solicitacaoDeAlteracao) async {
    //String fileName = file.path.split('/').last;

//    FormData data = FormData.fromMap({
//      "file": await MultipartFile.fromFile(
//
//        file.path,
//        filename: fileName,
//      ),
//    });

    //setando tipo de solicitacao
    solicitacaoDeAlteracao.tipoSolicitacaoId = "5";//condutor_cadastro

    //Map<String, dynamic> data = solicitacaoDeAlteracao.toMap();

    Map<String, dynamic> fileMap = solicitacaoDeAlteracao.toMap();

    File arquivo1 = File(solicitacaoDeAlteracao.arquivo1);
    fileMap["arquivo1"] = MultipartFile(arquivo1.openRead(), await arquivo1.length(), filename: "arquivo1.jpg");

    File arquivo2 = File(solicitacaoDeAlteracao.arquivo2);
    fileMap["arquivo2"] = MultipartFile(arquivo2.openRead(), await arquivo2.length(), filename: "arquivo2.jpg");

    if(solicitacaoDeAlteracao.arquivo3!=null) {
      File arquivo3 = File(solicitacaoDeAlteracao.arquivo3);
      fileMap["arquivo3"] = MultipartFile(arquivo3.openRead(), await arquivo3.length(), filename: "arquivo3.jpg");
    }

    fileMap["tipo_solicitacao_id"] = "5";

    //fileMap.addAll(solicitacaoDeAlteracao.toMap());

    await dio.post(url, data: FormData.fromMap(fileMap));
  }

}
