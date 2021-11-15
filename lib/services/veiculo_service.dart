import 'dart:convert';

import 'package:sa_transportes_mobile/services/main_service.dart';

class VeiculoService extends MainService {
  VeiculoService() {
    super.endPoint = '/veiculos';
    super.endPointVersion = 1;
  }
}
