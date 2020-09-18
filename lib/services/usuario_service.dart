import 'dart:convert';

import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService extends MainService {
  static final Pattern jwtPattern =
      "^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.?[A-Za-z0-9-_.+/=]*\$";

  Future<Usuario> me() async {
    return Usuario.fromJson(
        (await dio.get(urlApi + '/api/me', options: await getHeader())).data);
  }

  Future<bool> logout() async {
    await dio.get(urlApi + '/auth/logout', options: await getHeader());
    return true;
  }

  Future<String> login(String email, String senha) async {
    Response response = await dio.post(urlApi + '/auth/login', data: {
      "email": email,
      "password": senha,
    });

    Map<String, dynamic> jsonMap = response.data;
    if (new RegExp(jwtPattern).hasMatch(jsonMap['token'])) {
      return jsonMap['token'];
    }

    return null;
  }

  Future<bool> signin(
      {String nome,
      String email,
      String cpfCnj,
      String cnh,
      String senha}) async {
    await dio.post(urlApi + '/auth/signin', data: {
      "nome": nome,
      "email": email,
      "cpf_cnpj": cpfCnj,
      "cnh": cnh,
      "password": senha,
    });

    return true;
  }

  Future<bool> update(Usuario usuario) async {
    await dio.put(
      urlApi + '/api/me',
      data: usuario.toMap(),
      options: await getHeader(),
    );

    return true;
  }

  Future<bool> updatePassword({@required String senhaAtual, @required String novaSenha}) async {
    await dio.patch(
      urlApi + '/api/password',
      data: {"password": senhaAtual, "new_password": novaSenha},
      options: await getHeader(),
    );
    return true;
  }

  Future<bool> generateRecoverCode(String email) async {
    await dio.post(
      urlApi + '/auth/generaterecovercode',
      data: {"email": email},
    );

    return true;
  }

  Future<bool> validateRecoverCode(String email, String code) async {
    await dio.post(
      urlApi + '/auth/validaterecoverycode',
      data: {
        "email": email,
        "code": code,
      },
    );

    return true;
  }

  Future<bool> recoverPassword(
      String email, String code, String password) async {
    await dio.post(
      urlApi + '/auth/recoverypassword',
      data: {
        "email": email,
        "code": code,
        "new_password": password,
      },
    );

    return true;
  }

  Future<String> refreshToken() async {
    Response response =
        await dio.get(urlApi + '/auth/refresh', options: await getHeader());

    Map<String, dynamic> jsonMap = response.data;
    if (new RegExp(jwtPattern).hasMatch(jsonMap['token'])) {
      return jsonMap['token'];
    }

    return null;
  }
}
