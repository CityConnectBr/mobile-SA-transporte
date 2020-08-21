import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';

class UsuarioService extends MainService {
  static final Pattern jwtPattern =
      "^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.?[A-Za-z0-9-_.+/=]*\$";

  Future<bool> login(String email, String senha) async {
    FormData formData = FormData.fromMap({"email": email, "password": senha});

    Response response =
        await Dio().post(urlApi + '/auth/login', data: formData);

    if (new RegExp(jwtPattern).hasMatch(response.data['token'])) {
      MainService.token = response.data['token'];
    }

    return true;
  }

  Future<bool> signin(
    {String nome, String email, String cpfCnj, String cnh, String senha}) async {

    FormData formData = FormData.fromMap({
        "nome": nome,
        "email": email,
        "cpf_cnpj": cpfCnj,
        "cnh": cnh,
        "password": senha,
      });

    Response response =
        await Dio().post(urlApi + '/auth/signin', data: formData);

    /*if (new RegExp(jwtPattern).hasMatch(response.data['token'])) {
      MainService.token = response.data['token'];
    }*/

    return true;
  }
}
