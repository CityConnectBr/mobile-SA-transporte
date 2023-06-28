import 'dart:io';

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
    return DotEnv().env['URL_API'];
  }

  MainService() {
    dio.options.baseUrl = MainService.URLApi;
    simpleDio.options.baseUrl = MainService.URLApi;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        final token = await getToken();
        if (token != null && token.isNotEmpty) {
          request.headers['Authorization'] = "Bearer " + token;
          request.headers['Content-Type'] = "application/json";
        }
        return handler.next(request);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final options = error.response.requestOptions;
          // Lock to block the incoming request until the token updated
          dio.lock();
          dio.interceptors.responseLock.lock();
          dio.interceptors.errorLock.lock();
          final request = await simpleDio.get("/auth/refresh", options: Options(headers: options.headers));
          if (new RegExp(ValidatorsUtil.jwtPattern).hasMatch(request.data['newToken'])) {
            setToken(request.data['newToken']);
            options.headers['Authorization'] = "Bearer " + request.data['newToken'];
          }
          dio.unlock();
          dio.interceptors.responseLock.unlock();
          dio.interceptors.errorLock.unlock();
          /*simpleDio
              .get("/auth/refresh", options: Options(headers: options.headers))
              .then((request) => {
                    if (new RegExp(ValidatorsUtil.jwtPattern).hasMatch(request.data['newToken']))
                      {
                        setToken(request.data['newToken']),
                        options.headers['Authorization'] = "Bearer " + request.data['newToken']
                      }
                  })
              .whenComplete(() => {
                    dio.unlock(),
                    dio.interceptors.responseLock.unlock(),
                    dio.interceptors.errorLock.unlock(),
                  })
              .then((_) => {
                    dio.request(options.path, options: Options(headers: options.headers)),
                  });*/

          return handler.next(error);
        }
      },
    ));

    //TODO: testar
    /*dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final token = await getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = "Bearer " + token;
      }
      return options;
    }, onError: (DioError error) {
      // Assume 401 stands for token expired
      if (error.response?.statusCode == 401) {
        RequestOptions options = error.response.request;
        // Lock to block the incoming request until the token updated
        dio.lock();
        dio.interceptors.responseLock.lock();
        dio.interceptors.errorLock.lock();
        return simpleDio.get("/auth/refresh", options: options).then((d) async {
          print("refresh token");
          print(d.data['newToken']);
          //update token
          if (new RegExp(ValidatorsUtil.jwtPattern).hasMatch(d.data['newToken'])) {
            setToken(d.data['newToken']);
            options.headers['Authorization'] = "Bearer " + d.data['newToken'];
          }
        }).whenComplete(() {
          dio.unlock();
          dio.interceptors.responseLock.unlock();
          dio.interceptors.errorLock.unlock();
        }).then((e) {
          //repeat request
          return dio.request(options.path, options: options);
        });
      }
      print(error);
      return error;
    }));*/
  }

  String makeEndPoint({String endPoint, Usuario usuario, int endPointVersion}) {
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

  Future download({String url, File file}) async {
      Response response = await dio.get(
        url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
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
