import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class TipoCombustivelService extends MainService {
  TipoCombustivelService() {
    super.endPoint = '/tiposcombustiveis';
    super.endPointVersion = 1;
  }
}
