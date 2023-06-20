import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';

class VeiculoService extends MainService {
  VeiculoService() {
    super.endPoint = '/veiculos';
    super.endPointVersion = 1;
  }

  Future<bool> checkPlaca(String parametro) {
    final dio = Dio(
      BaseOptions(baseUrl: MainService.URLApi, headers: {
        'Content-Type': 'application/json',
        'token': DotEnv().env['API_TOKEN_WITHOUT_AUTH']
      }),
    );

    var response = dio.get("/apisat/permissaodeoperacao/$parametro");

    return response.then(
      (value) {
        if (value.statusCode == 200 && value.data['alvaraValido']) {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}
