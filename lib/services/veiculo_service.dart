import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class VeiculoService extends MainService {
  VeiculoService() {
    super.endPoint = '/veiculos';
    super.endPointVersion = 1;
  }
}
