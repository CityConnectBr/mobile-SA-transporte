import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class CorVeiculoService extends MainService {
  CorVeiculoService() {
    super.endPoint = '/coresveiculos';
    super.endPointVersion = 1;
  }
}
