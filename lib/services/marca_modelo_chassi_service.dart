import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class MarcaModeloChassiService extends MainService {
  MarcaModeloChassiService() {
    super.url = '/api/permissionarios/marcasmodeloschassis';
  }
}
