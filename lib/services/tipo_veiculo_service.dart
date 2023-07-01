import 'dart:convert';

import 'package:sa_transportes_mobile/services/main_service.dart';

class TipoVeiculoService extends MainService {
  TipoVeiculoService() {
    super.endPoint = '/tiposveiculos';
    super.endPointVersion = 1;
  }
}
