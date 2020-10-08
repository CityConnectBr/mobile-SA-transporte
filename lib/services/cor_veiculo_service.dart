import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class CorVeiculoService extends MainService {
  CorVeiculoService() {
    super.url = '/api/permissionarios/coresveiculos';
  }
}
