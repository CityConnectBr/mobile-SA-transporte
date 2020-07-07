import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static const String KEY_NOME = "smfstopadua_nome";
  static const String KEY_ID = "smfstopadua_id";
  static const String KEY_CPF = "smfstopadua_cpf";
  static const String KEY_MATRICULA = "smfstopadua_matricula";
  static const String KEY_FOTO = "smfstopadua_foto";
  static const String KEY_QRCODE = "smfstopadua_qrcode";

  Future<Null> save(String key, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }


  Future<String> get(String key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

}