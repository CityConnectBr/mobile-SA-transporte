import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:satrans_new_app/services/main_service.dart';
import 'package:satrans_new_app/utils/dio_interceptor.dart';

class VeiculoService extends MainService {
  VeiculoService() {
    super.endpoint = '/veiculos';
    super.endpointVersion = 1;
  }

  Future<bool> checkPlaca(String placa) {
    final dio = Dio(
      BaseOptions(baseUrl: MainService.urlApi, headers: {
        'Content-Type': 'application/json',
        'token': dotenv.env['API_TOKEN_WITHOUT_AUTH']
      }),
    );

    dio.interceptors.add(CustomInterceptors());

    var response = dio.get("/apisat/statusveiculo/$placa");

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
