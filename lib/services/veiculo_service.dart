import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class VeiculoService extends MainService {
  VeiculoService() {
    super.url = '/api/permissionarios/veiculos';
  }
}
