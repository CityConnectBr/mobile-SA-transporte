import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class TipoVeiculoService extends MainService {
  TipoVeiculoService() {
    super.url = '/api/permissionarios/tiposveiculos';
  }
}
