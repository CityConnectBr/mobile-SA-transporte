import 'dart:io';

import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';

class PontoDoPermissionarioService extends MainService {
  PontoDoPermissionarioService() {
    super.endPoint = '/pontos';
    super.endPointVersion = 1;
  }

  Future<List<dynamic>> findAll(Usuario userLogged) async {
    return (await dio.get(makeEndPoint(usuario: userLogged),)).data;
  }

  Future<List<dynamic>> searchPontoEscolar(String search, Usuario userLogged) async {    
    return (await dio.get(makeEndPoint(usuario: userLogged), queryParameters: {
      'search': search,
      'modalidade': 'escolar',
    },)).data['data'];
  }

}
