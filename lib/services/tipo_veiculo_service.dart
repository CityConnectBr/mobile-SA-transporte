import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class TipoVeiculoService extends MainService {
  TipoVeiculoService() {
    super.endPoint = '/tiposveiculos';
    super.endPointVersion = 1;
  }
}
