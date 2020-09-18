import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandlerUtil {
  final Object exception;

  ErrorHandlerUtil(this.exception);

  dynamic getMessegeToUser() {

    try {
      if (exception is Exception) {
        if (exception.runtimeType == SocketException) {
          return "Falha ao conectar ao servidor.";
        } else if (exception.runtimeType == DioError) {
          DioError dioError = exception;

          final Map<String, dynamic> jsonData = json.decode(
              dioError.response.toString().replaceFirst("Exception: ", ""));
          if (jsonData.containsKey("message")) {
            return jsonData['message'];
          } else if (jsonData.containsKey("messages")) {
            String msgs = "Problemas encontrados:";
            jsonData['messages'].values.forEach((element) {
              msgs = msgs + "\n - " + element[0];
            });
            return msgs;
          }
        }
      }
    } catch (e) {
      print(e);
    }

    return "Ocorreu um erro ao executar esta ação";
  }
}
