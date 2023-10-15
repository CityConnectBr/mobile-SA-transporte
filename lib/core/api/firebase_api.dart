import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Preferences().addList(
      "push",
      jsonEncode({
        "title": message.notification!.title,
        "body": message.notification!.body,
      }));
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    //print("Firebase token: $token");
    Preferences().save(Preferences.KEY_TOKEN_FCM, token);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Preferences().addList(
          "push",
          jsonEncode({
            "title": message.notification!.title,
            "body": message.notification!.body,
          }));
    });
  }
}
