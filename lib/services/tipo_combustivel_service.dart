import 'dart:convert';

import 'package:sa_transportes_mobile/services/main_service.dart';

class TipoCombustivelService extends MainService {
  TipoCombustivelService() {
    super.endPoint = '/tiposcombustiveis';
    super.endPointVersion = 1;
  }
}
