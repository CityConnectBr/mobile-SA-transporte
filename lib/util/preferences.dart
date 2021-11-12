import 'package:cityconnect/util/security_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String KEY_LAST_JWT = "last_jwt";
  static const String KEY_LAST_PHOTO = "last_photo";

  Future<Null> save(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value != null ? SecurityUtil.encrypt(value) : null);
  }

  Future<String> get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return SecurityUtil.dencrypt(prefs.getString(key));
    }

    return null;
  }
}
