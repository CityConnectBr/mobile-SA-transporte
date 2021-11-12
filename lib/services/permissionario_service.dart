import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:cityconnect/util/util.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PermissionarioService extends MainService {
  PermissionarioService() {
    super.endPoint = '/permissionarios';
    super.endPointVersion = 1;
  }

}
