import 'dart:convert';
import 'dart:io';

class ErrorHandlerUtil {
  final Exception exception;

  ErrorHandlerUtil(this.exception);

  dynamic getMessegeToUser() {
    print(exception);
    try {
      if (exception.runtimeType == SocketException) {
        return "Falha ao conectar ao servidor.";
      } else {
        final Map<String, dynamic> jsonData =
            json.decode(exception.toString().replaceFirst("Exception: ", ""));
        if (jsonData.containsKey("message")) {
          return jsonData['message'];
        } else {
          String msgs = "Problemas encontrados:";
          jsonData.values.forEach((element) {
              msgs = msgs + "\n - " + element[0];
          });
          return msgs;
        }
      }
    } catch (e) {
      print(e);
    }

    return "Ocorreu um erro ao executar esta ação";
  }
}
