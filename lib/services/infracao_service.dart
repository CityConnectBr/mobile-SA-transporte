import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';

class InfracaoService extends MainService {
  InfracaoService() {
    super.endPoint = '/infracoes';
    super.endPointVersion = 1;
  }

  Future<List<dynamic>> loadAll(Usuario userLogged) async {
    return (await dio.get(
      makeEndPoint(usuario: userLogged),
    ))
        .data;
  }

  Future<void> pagar(String infracaoId, File image, Usuario userLogged) async {
    Map<String, dynamic> fileMap = {
      "arquivo": MultipartFile(
        image.openRead(),
        await image.length(),
        filename: "arquivo.jpg",
      ),
    };

    await dio.post(
      "${makeEndPoint(usuario: userLogged)}/$infracaoId/setpagamento",
      data: FormData.fromMap(fileMap),
    );
  }
}
