import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Base64Codec base64 = const Base64Codec();
  static const String KEY_LAST_JWT = "last_jwt";
  static const String KEY_LAST_PHOTO = "last_photo";

  Future<void> save(String key, String ?value) async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value == null || value.isEmpty) {
      prefs.remove(key);
      return;
    }

    prefs.setString(key, base64.encode(utf8.encode(value)));
  }

  Future<String> get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return utf8.decode(base64.decode(prefs.getString(key)!));
    }

    return "";
  }
}
