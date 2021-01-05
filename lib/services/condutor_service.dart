import 'dart:convert';

import 'package:cityconnect/services/main_service.dart';

class CondutorService extends MainService {
  CondutorService() {
    super.endPoint = '/condutores';
    super.endPointVersion = 1;
  }

//  Future<Condutor> invalidate(String id) async {
//    return Condutor.fromJson((await dio.delete(_url_default + "/${id}")).data);
//  }
}
