import 'package:cityconnect/services/usuario_service.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool loading = false;

  UsuarioService _usuarioService = UsuarioService();

  @action
  Future<void> login(
      {String email,
      String senha,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      await _usuarioService.login(email, senha);
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(context, scaffoldKey, "Ocorreu um erro");
    }

    loading = false;
  }
}
