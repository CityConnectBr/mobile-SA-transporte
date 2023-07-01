import 'package:dio/dio.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';

class DioHandlerTokenInterceptors extends Interceptor {
  final _prefs = Preferences();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String lastToken = await _prefs.get(Preferences.KEY_LAST_JWT);

    if (lastToken != null && lastToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $lastToken";
    }

    handler.next(options);
  }
}
