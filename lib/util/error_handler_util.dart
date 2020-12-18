import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ErrorHandlerUtil {
  final Object exception;

  bool _DEBUG = false;

  ErrorHandlerUtil(this.exception) {
    try {
      this._DEBUG = DotEnv().env['DEBUG'] != null ? DotEnv().env['DEBUG'].toString().contains("true") : false;
    } catch (e) {}
  }

  dynamic getMessegeToUser() {
    try {
      if (exception is Exception) {

        if (exception.runtimeType == DioError) {
          DioError dioError = exception;
          if (DioErrorType.RECEIVE_TIMEOUT == dioError.type ||
              DioErrorType.CONNECT_TIMEOUT == dioError.type) {
            return "Servidor não encontrado. Verifique sua internet por favor.";
          } else if (DioErrorType.RESPONSE == dioError.type) {
            final Map<String, dynamic> jsonData = json.decode(dioError.response.toString().replaceFirst("Exception: ", ""));
            if (jsonData.containsKey("message")) {
              dynamic jsonAuxData = jsonData['message']!=null?jsonData['message']:jsonData['messages'];
              if (jsonAuxData.toString().startsWith("[")) {
                print("--------------");
                String msgs = "Problemas encontrados:";
                List<dynamic> listErros = jsonAuxData;
                listErros.forEach((element) {
                  //msgs = msgs + "\n - " + element[0];
                  msgs = msgs + "\n - " + element;
                });
                return msgs;
              }

              return jsonAuxData;
            } else if (jsonData.length > 0) {
              String msgs = "Problemas encontrados:";
              jsonData.values.forEach((element) {
                msgs = msgs + "\n - " + element[0];
              });
              return msgs;
            } else {
              print(dioError.response.toString());
            }
          } else if (dioError.message.contains('SocketException')) {
            return "Ocorreu um problema ao se conectar com o servidor.";
          } else {
            return "Ocorreu um problema ao se conectar com o servidor. Tente novamente mais tarde.";
          }
        }else{
          return "Ocorreu um problema. Entre em contato com o administrador.";
        }
      }
    } catch (e) {
      print(e);
      if (this._DEBUG) {
        return e.toString();
      }
    }

    if (this._DEBUG) {
      return exception.toString();
    }
    return "Ocorreu um erro ao executar esta ação";
  }
}
