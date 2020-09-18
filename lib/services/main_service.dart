import 'package:cityconnect/util/preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainService {
  @protected
  final String urlApi = DotEnv().env['URL_API'];

  final dio = Dio();

  @protected
  Future<Options> getHeader() async{
    Options header = Options(
      headers: {'Authorization': "Bearer " + await Preferences().get(Preferences.KEY_LAST_JWT)},
    );

    return header;
  }

}
