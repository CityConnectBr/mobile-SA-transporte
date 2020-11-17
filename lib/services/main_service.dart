import 'package:cityconnect/util/preferences.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainService {
  final dio = Dio();
  final simpleDio = Dio();

  String url;

  MainService() {
    dio.options.baseUrl = DotEnv().env['URL_API'];
    simpleDio.options.baseUrl = DotEnv().env['URL_API'];
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
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
          if (new RegExp(ValidatorsUtil.jwtPattern)
              .hasMatch(d.data['newToken'])) {
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
    }));
  }

  @protected
  Future<String> getToken() async {
    return await Preferences().get(Preferences.KEY_LAST_JWT);
  }

  @protected
  Future<Null> setToken(String token) async {
    await Preferences().save(Preferences.KEY_LAST_JWT, token);
  }

  ///////////////////////////////////

  Future<List<dynamic>> search(String search) async {
    return (await dio.get(url, queryParameters: {"search": search}))
        .data['data'];
  }

  Future<dynamic> create(json) async {
    return await dio.post(url, data: json);
  }

  Future<bool> update(String id, json) async {
    await dio.put(
      url + "/${id}",
      data: json,
    );

    return true;
  }

  Future<dynamic> get(int id) async {
    return (await dio.get(
      url + "/${id}",
    ))
        .data;
  }
}
