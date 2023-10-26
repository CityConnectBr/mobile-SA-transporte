import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';

// Quando o app estiver em background
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Preferences().addList(
      "push",
      jsonEncode({
        "title": message.notification!.title,
        "body": message.notification!.body,
      }));
}

// Quando o app estiver em aberto
Future<void> handleForegroundMessage(RemoteMessage message) async {
  Preferences().addList(
      "push",
      jsonEncode({
        "title": message.notification!.title,
        "body": message.notification!.body,
      }));

  GetIt getIt = GetIt.instance;

  AppState appState = getIt.get<AppState>();

  final scaffoldKey = appState.scaffoldKey;
  final context = appState.context;

  if (message.notification != null && context != null && scaffoldKey != null) {
    SnackMessages.showSnackBarWarning(
        context, scaffoldKey, "Mensagem: "+message.notification!.body!);
  }
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
      handleForegroundMessage(message);
    });
  }
}
