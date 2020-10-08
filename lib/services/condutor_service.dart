import 'dart:convert';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';

class CondutorService extends MainService {
  CondutorService() {
    super.url = '/api/permissionarios/condutores';
  }

//  Future<Condutor> invalidate(String id) async {
//    return Condutor.fromJson((await dio.delete(_url_default + "/${id}")).data);
//  }
}
