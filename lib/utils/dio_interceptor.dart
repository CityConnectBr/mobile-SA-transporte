import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:satrans_new_app/main.dart';
import 'package:satrans_new_app/utils/snackbar.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == 401) {
    } else if (err.response?.statusCode == 403) {
    } else if (err.response?.statusCode == 404) {
    } else if (err.response?.statusCode == 500) {
      SnackBarUtils.showSnackBarError(
          Main.navigatorKey.currentContext!, "Erro interno do servidor");
    } else if (err.response?.statusCode == 503) {
      SnackBarUtils.showSnackBarError(
          Main.navigatorKey.currentContext!, "Serviço indisponível");
    } else {
      SnackBarUtils.showSnackBarError(
          Main.navigatorKey.currentContext!, "Erro ao conectar ao servidor");
    }

    handler.next(err);
  }
}
