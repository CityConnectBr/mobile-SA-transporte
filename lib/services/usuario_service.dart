import 'dart:convert';

import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService extends MainService {
  Future<String> login(String email, String senha) async {
    Response response = await dio.post('/auth/login', data: {
      "email": email,
      "password": senha,
    });

    Map<String, dynamic> jsonMap = response.data;
    if (new RegExp(ValidatorsUtil.jwtPattern).hasMatch(jsonMap['token'])) {
      super.setToken(jsonMap['token']);
      return jsonMap['token'];
    }
  }

  Future<Usuario> getUser() async {
    if ((await super.getToken()) != null) {
      return Usuario.fromJson((await dio.get('/api/user')).data);
    }
  }

  Future<bool> logout() async {
    await dio.get('/auth/logout');
    return true;
  }

  Future<bool> signin(
      {String nome,
      String email,
      String cpfCnj,
      String cnh,
      String senha}) async {
    await dio.post('/auth/signin', data: {
      "nome": nome,
      "email": email,
      "cpf_cnpj": cpfCnj,
      "cnh": cnh,
      "password": senha,
    });

    return true;
  }

  Future<bool> updateUser(Usuario usuario) async {
    await dio.put(
      '/api/user',
      data: usuario.toMap(),
    );

    return true;
  }

  Future<bool> updatePassword(
      {@required String senhaAtual, @required String novaSenha}) async {
    await dio.patch(
      '/api/password',
      data: {"password": senhaAtual, "new_password": novaSenha},
    );
    return true;
  }

  Future<bool> generateRecoverCode(String email) async {
    await dio.post(
      '/auth/generaterecovercode',
      data: {"email": email},
    );

    return true;
  }

  Future<bool> validateRecoverCode(String email, String code) async {
    await dio.post(
      '/auth/validaterecoverycode',
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
      '/auth/recoverypassword',
      data: {
        "email": email,
        "code": code,
        "new_password": password,
      },
    );

    return true;
  }
}
