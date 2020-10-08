import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class MarcaModeloVeiculoService extends MainService {
  MarcaModeloVeiculoService() {
    super.url = '/api/permissionarios/marcasmodelosveiculos';
  }
}
