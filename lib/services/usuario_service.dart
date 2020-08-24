import 'dart:convert';

import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class UsuarioService extends MainService {
  static final Pattern jwtPattern =
      "^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.?[A-Za-z0-9-_.+/=]*\$";

  Future<Usuario> me() async {

    final response = await http.get(urlApi + '/api/me',
        headers: {'Authorization': "Bearer "+MainService.token},
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> logout() async {

    final response = await http.get(urlApi + '/auth/logout',
      headers: {'Authorization': "Bearer "+MainService.token},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> login(String email, String senha) async {

    final response = await http.post(urlApi + '/auth/login',
        //headers: {'auth': _auth},
        body: {
          "email": email,
          "password": senha,
        }
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      if (new RegExp(jwtPattern).hasMatch(jsonMap['token'])) {
        MainService.token = jsonMap['token'];
        print(MainService.token);
        return true;
      }
    } else {
      throw Exception(response.body);
    }

    return false;
  }

  Future<bool> signin({String nome, String email, String cpfCnj, String cnh, String senha}) async {

    final response = await http.post(urlApi + '/auth/signin',
        //headers: {'auth': _auth},
        body: {
          "nome": nome,
          "email": email,
          "cpf_cnpj": cpfCnj,
          "cnh": cnh,
          "password": senha,
        }
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

}
