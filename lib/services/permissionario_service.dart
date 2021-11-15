import 'dart:io';

import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PermissionarioService extends MainService {
  PermissionarioService() {
    super.endPoint = '/permissionarios';
    super.endPointVersion = 1;
  }

}
