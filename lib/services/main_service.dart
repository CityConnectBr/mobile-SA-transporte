import 'package:cityconnect/util/preferences.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainService {
  final dio = Dio();
  final _tokenDio = Dio();

  MainService() {
    dio.options.baseUrl = DotEnv().env['URL_API'];
    _tokenDio.options.baseUrl = DotEnv().env['URL_API'];
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final token = await _getToken();
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
        return _tokenDio.get("/auth/refresh", options: options).then((d) async {
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
      return error;
    }));
  }

  static String _token;

  static Future<String> _getToken() async {
    if (_token == null) {
      _token = await Preferences().get(Preferences.KEY_LAST_JWT);
    }

    return _token;
  }

  static void setToken(String token) async {
    Preferences().save(Preferences.KEY_LAST_JWT, token);
    _token = token;
  }
}
