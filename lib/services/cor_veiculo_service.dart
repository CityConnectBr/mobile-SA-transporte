import 'dart:convert';

import 'package:sa_transportes_mobile/services/main_service.dart';

class CorVeiculoService extends MainService {
  CorVeiculoService() {
    super.endPoint = '/coresveiculos';
    super.endPointVersion = 1;
  }
}
