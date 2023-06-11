import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:satrans_new_app/models/usuario_model.dart';
import 'package:satrans_new_app/utils/preferences.dart';
import 'package:satrans_new_app/utils/dio_interceptor.dart';

class MainService {
  final dio = Dio(
    BaseOptions(
      baseUrl: MainService.urlApi,
    ),
  );

  String endpoint = "";
  int endpointVersion = 1;

  static String get urlApi {
    final url = dotenv.env['URL_API'];

    if (url == null) {
      throw Exception('URL_API not found in .env file');
    }

    return url;
  }

  MainService() {
    dio.interceptors.add(CustomInterceptors());
  }

  /*String makeEndpoint({
    String? endpoint,
    Usuario? usuario,
    int? endpointVersion,
  }) {
    String endPointAux = "/api";

    if (usuario != null) {
      switch (usuario.tipo.id) {
        case 1:
          endPointAux += "/permissionarios";
          break;
        case 2:
          endPointAux += "/condutores";
          break;
        case 3:
          endPointAux += "/fiscais";
          break;
      }
    }

    endPointAux += endpointVersion != null
        ? "/v$endpointVersion"
        : "/v${this.endpointVersion}"; //setando versao

    return endPointAux + (endpoint ?? this.endpoint);
  }*/

  Future<String> getToken() async {
    return await Preferences().get(Preferences.KEY_LAST_JWT);
  }

  Future<void> setToken(String token) async {
    await Preferences().save(Preferences.KEY_LAST_JWT, token);
  }
}
