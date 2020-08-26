import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/screen/login_screen.dart';
import 'package:cityconnect/services/usuario_service.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/util/preferences.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'usuario_store.g.dart';

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  @observable
  bool loading = false;
  @observable
  bool showRecoverCodeField = false;
  @observable
  bool showRecoverPasswordField = false;

  UsuarioService _usuarioService = UsuarioService();

  final _prefs = Preferences();

  @observable
  Usuario usuario;

  @action
  Future<void> isLoggedIn(BuildContext context) async {
    if (await this._isLoggedIn()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @action
  Future<void> login(
      {String email,
      String senha,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await _usuarioService.login(email, senha));
      usuario = await _usuarioService.me();

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(context, scaffoldKey, "Ocorreu um erro");
    }

    loading = false;
  }

  @action
  Future<void> signin(
      {String nome,
      String email,
      String cpfCnpj,
      String cnh,
      String senha,
      String confirmacaoDeSenha,
      bool contratoAceito,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    bool aux = true;
    if (senha.compareTo(confirmacaoDeSenha) != 0) {
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "A senhas sua confirmação não são iguais.");
    }

    if (!contratoAceito) {
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "É necessário aceitar os termos de uso.");
    }

    if (aux) {
      try {
        if (await _usuarioService.signin(
            nome: nome,
            email: email,
            cpfCnj: cpfCnpj,
            cnh: cnh,
            senha: senha)) {
          assert(await _usuarioService.login(email, senha));
          usuario = await _usuarioService.me();

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      } catch (e) {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }
    }

    loading = false;
  }

  @action
  Future<void> initPasswordRecovery(
      {String email,
        BuildContext context,
        GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

      try {
        if (await _usuarioService.generateRecoverCode(email)) {
          this.showRecoverCodeField = true;
        }
      } catch (e) {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }

    loading = false;
  }

  @action
  Future<void> validateRecoveryCode(
      {String email,
        String code,
        BuildContext context,
        GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await _usuarioService.validateRecoverCode(email, code)) {
        this.showRecoverPasswordField = true;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> recoveryPassword(
      {String email,
        String code,
        String senha,
        String confirmacaoDeSenha,
        BuildContext context,
        GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    bool aux = true;
    if (senha.compareTo(confirmacaoDeSenha) != 0) {
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "A senhas sua confirmação não são iguais.");
    }

    if (aux) {
      try {
        if (await _usuarioService.recoverPassword(email, code, senha)) {
          this.showRecoverCodeField = false;
          this.showRecoverPasswordField = false;

          SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Troca de senha efetuada com sucesso!");
        }
      } catch (e) {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }
    }

    loading = false;
  }


  @action
  Future<void> logout(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      await _usuarioService.logout();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  Future<bool> _isLoggedIn() async {
    try {
      String token = await _prefs.get(Preferences.KEY_LAST_JWT);

      if (token != null) {
        //verificar se login e valido
        //services me
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
