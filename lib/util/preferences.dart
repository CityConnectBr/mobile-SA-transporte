import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Base64Codec base64 = const Base64Codec();
  static const String KEY_LAST_JWT = "last_jwt";
  static const String KEY_LAST_PHOTO = "last_photo";
  static const String KEY_TOKEN_FCM = "token_fcm";//Firebase Cloud Messaging

  Future<void> save(String key, String? value) async {
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

  Future<void> addList(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    if (prefs.getStringList(key) != null) {
      list = prefs.getStringList(key)!;
    }
    list.add(value);
    prefs.setStringList(key, list);
  }

  Future<List<String>> getList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(key) != null) {
      return prefs.getStringList(key)!;
    }

    return [];
  }

  Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
