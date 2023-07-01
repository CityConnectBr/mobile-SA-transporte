import 'dart:io';

import 'package:sa_transportes_mobile/core/interceptors/dio_hadler_error_interceptor.dart';
import 'package:sa_transportes_mobile/core/interceptors/dio_hadler_token_interceptor.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainService {
  final dio = Dio();
  final simpleDio = Dio();

  String endPoint = "";
  int endPointVersion = 1;

  static String get URLApi {
    final url = dotenv.env['URL_API'];

    if (url == null) {
      throw Exception('URL_API not found in .env file');
    }

    return url;
  }

  MainService() {
    dio.options.baseUrl = MainService.URLApi;
    simpleDio.options.baseUrl = MainService.URLApi;


    dio.interceptors.add(DioHandlerTokenInterceptors());
    dio.interceptors.add(DioHandlerErrorInterceptors());
  }

  String makeEndPoint({String? endPoint, Usuario? usuario, int? endPointVersion}) {
    String endPointAux = "/api";

    if (usuario != null) {
      switch (usuario.tipo?.id) {
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

    endPointAux += endPointVersion != null ? "/v${endPointVersion}" : "/v${this.endPointVersion}"; //setando versao

    return endPointAux + (endPoint != null ? endPoint : this.endPoint);
  }

  @protected
  Future<String> getToken() async {
    return await Preferences().get(Preferences.KEY_LAST_JWT);
  }

  @protected
  Future<Null> setToken(String token) async {
    await Preferences().save(Preferences.KEY_LAST_JWT, token);
  }

  Future<Map<String, String>> getHeaderWithAuthToken() async {
    return {"Authorization": "Bearer " + (await this.getToken())};
  }

  ///////////////////////////////////

  Future<List<dynamic>> search(String search, Usuario userLogged) async {
    return (await dio.get(makeEndPoint(usuario: userLogged), queryParameters: {"search": search})).data['data'];
  }

  Future<dynamic> create(json, Usuario userLogged) async {
    return await dio.post(makeEndPoint(usuario: userLogged), data: json);
  }

  Future download({String? url, File? file}) async {
      if (url == null || file == null) {
        throw Exception("url or file is null");
      }
    
      Response response = await dio.get(
        url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      //print(response.headers);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
  }

  Future<bool> update(String id, json, Usuario userLogged) async {
    await dio.put(
      makeEndPoint(usuario: userLogged) + "/${id}",
      data: json,
    );

    return true;
  }

  Future<dynamic> get(int id, Usuario userLogged) async {
    return (await dio.get(
      makeEndPoint(usuario: userLogged) + "/${id}",
    ))
        .data;
  }
}
