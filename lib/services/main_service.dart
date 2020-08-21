import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainService {
  @protected

  final String urlApi = DotEnv().env['URL_API'];

  @protected
  static String token;
}
