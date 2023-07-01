import 'package:dio/dio.dart';
import 'package:sa_transportes_mobile/main.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';

class DioHandlerErrorInterceptors extends Interceptor {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == 401) {
    } else if (err.response?.statusCode == 403) {
    } else if (err.response?.statusCode == 404) {
    } else if (err.response?.statusCode == 500) {
      SnackMessages.showSnackBarError(
          Main.navigatorKey.currentContext!, null, "Erro interno do servidor");
    } else if (err.response?.statusCode == 503) {
      SnackMessages.showSnackBarError(
          Main.navigatorKey.currentContext!, null, "Serviço indisponível");
    } else {
      SnackMessages.showSnackBarError(
          Main.navigatorKey.currentContext!, null, "Erro ao conectar ao servidor");
    }

    handler.next(err);
  }
}
