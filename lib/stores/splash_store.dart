import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sa_transportes_mobile/screen/search_plate_screen.dart';
import 'package:sa_transportes_mobile/services/usuario_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends MainStore with Store {
  final _usuarioService = UsuarioService();

  final _prefs = Preferences();

  @action
  Future<bool> authUserLogged({required BuildContext context}) async {
    try {
      String token = await _prefs.get(Preferences.KEY_LAST_JWT);

      if (token == null) {
        throw Exception("Token inválido");
      }

      usuario = await _usuarioService.getUser();

      if (usuario != null) {
        return true;
      } else {
        throw Exception("Usuário não encontrado");
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  @action
  Future<void> initApp({required BuildContext context}) async {
    bool isLogged = false;
    Future<bool> authFuture;

    if (usuario != null) {
      return;
    }

    authFuture = authUserLogged(context: context);

    await Future.wait([
      authFuture,
      Future.delayed(const Duration(seconds: 3)),
    ]);

    isLogged = await authFuture;
    //TODO: Foi comentado pois estava dando erro. Verificar depois
    /*if (isLogged) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {*/
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SearchPlateScreen()));
    //}
  }
}
