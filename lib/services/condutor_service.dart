import 'dart:convert';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:dio/dio.dart';

class CondutorService extends MainService {
  final _url_default = '/api/permissionarios/condutores';

  Future<List<Condutor>> search(String search) async {
    List<dynamic> auxList =
        (await dio.get(_url_default, queryParameters: {"search": search}))
            .data; //["data"];

    return auxList.map((Object model) => Condutor.fromJson(model)).toList();
  }

  Future<Condutor> create(Condutor condutor) async {
    Response response = await dio.post(_url_default, data: condutor.toMap());

    return Condutor.fromJson(response.data);
  }

  Future<bool> update(Condutor condutor) async {
    await dio.put(
      _url_default + "/${condutor.id}",
      data: condutor.toMap(),
    );

    return true;
  }

  Future<Condutor> get(int id) async {
    return Condutor.fromJson((await dio.get(
      _url_default + "/${id}",
    ))
        .data);
  }

  Future<Condutor> invalidate(String id) async {
    return Condutor.fromJson((await dio.delete(_url_default + "/${id}")).data);
  }
}
