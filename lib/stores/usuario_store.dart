import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/screen/login_screen.dart';
import 'package:cityconnect/services/usuario_service.dart';
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

  UsuarioService _usuarioService = UsuarioService();

  final _prefs = Preferences();

  @action
  Future<void> isLoggedIn(BuildContext context) async{
    if(await this._isLoggedIn()){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }else{
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
      await _usuarioService.login(email, senha);

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
    if(senha.compareTo(confirmacaoDeSenha)!=0){
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "A senhas sua confirmação não são iguais.");
    }

    if(!contratoAceito){
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "É necessário aceitar os termos de uso.");
    }

    if(aux) {
      try {
        print(await _usuarioService.signin(nome: nome,
            email: email,
            cpfCnj: cpfCnpj,
            cnh: cnh,
            senha: senha));
      } catch (e) {
        print(e);
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Ocorreu um erro");
      }
    }

    loading = false;
  }

  Future<bool> _isLoggedIn() async{
    try{
      String token = await _prefs.get(Preferences.KEY_LAST_JWT);

      if(token!=null){
        //verificar se login e valido
        //services me
      }

      return false;
    }catch(e){
      return false;
    }
  }
}
