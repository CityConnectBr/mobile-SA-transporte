import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class MarcaModeloCarroceriaService extends MainService {
  MarcaModeloCarroceriaService() {
    super.url = '/api/permissionarios/marcasmodeloscarrocerias';
  }
}