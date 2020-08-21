import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static const String KEY_LAST_JWT = "last_jwt";

  Future<Null> save(String key, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }


  Future<String> get(String key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

}