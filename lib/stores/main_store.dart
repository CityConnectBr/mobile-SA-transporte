import 'dart:io';

import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/screen/condutor/condutor_user_screen.dart';
import 'package:sa_transportes_mobile/screen/home_screen.dart';
import 'package:sa_transportes_mobile/screen/login_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/permissionario_user_screen.dart';
import 'package:sa_transportes_mobile/services/usuario_service.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  bool loading = false;
  @observable
  bool solicitacaoExistente = false;
  @observable
  bool showRecoverCodeField = false;
  @observable
  bool showRecoverPasswordField = false;

  @observable
  File photoUser;

  final _usuarioService = UsuarioService();

  final _prefs = Preferences();

  @observable
  Usuario usuario;

  @action
  Future<void> login({String email, String senha, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      String token = await _usuarioService.login(email, senha);

      if (token == null) {
        throw Exception("Token inválido");
      }

      //armazenando token gerado
      await _prefs.save(Preferences.KEY_LAST_JWT, token);

      usuario = await Future.value(_usuarioService.getUser()).timeout(const Duration(seconds:5));

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
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
      SnackMessages.showSnackBarError(context, scaffoldKey, "A senha não confere com a confirmação.");
    }

    if (!contratoAceito) {
      aux = false;
      SnackMessages.showSnackBarError(context, scaffoldKey, "É necessário aceitar os termos de uso.");
    }

    if (aux) {
      try {
        if (await _usuarioService.signin(nome: nome, email: email, cpfCnj: cpfCnpj, cnh: cnh, senha: senha)) {
          // String token = await _usuarioService.login(email, senha);
          //
          // if (token == null) {
          //   throw Exception("Token inválido");
          // }
          //
          // //armazenando token gerado
          // await _prefs.save(Preferences.KEY_LAST_JWT, token);
          //
          // usuario = await _usuarioService.getUser();

          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } catch (e) {
        SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }
    }

    loading = false;
  }

  @action
  Future<void> initPasswordRecovery({String email, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await _usuarioService.generateRecoverCode(email)) {
        this.showRecoverCodeField = true;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> validateRecoveryCode({String email, String code, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await _usuarioService.validateRecoverCode(email, code)) {
        this.showRecoverPasswordField = true;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> recoveryPassword(
      {String email, String code, String senha, String confirmacaoDeSenha, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    bool aux = true;
    if (senha.compareTo(confirmacaoDeSenha) != 0) {
      aux = false;
      SnackMessages.showSnackBarError(context, scaffoldKey, "A senhas sua confirmação não são iguais.");
    }

    if (aux) {
      try {
        if (await _usuarioService.recoverPassword(email, code, senha)) {
          this.showRecoverCodeField = false;
          this.showRecoverPasswordField = false;

          SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Troca de senha efetuada com sucesso!");
        }
      } catch (e) {
        SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }
    }

    loading = false;
  }

  @action
  Future<void> editUser({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    if (await this.isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false)) {
      this._reloadUser();

      if(usuario.permissionario!=null){
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => PermissionarioUserScreen()));
      }else if(usuario.condutor!=null){
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorUserScreen()));
      }else if(usuario.fiscal!=null){

      }
    }
  }

  @action
  Future<void> saveUser(
      {String nome,
      String rg,
      String naturalidade,
      String nacionalidade,
      String inscricaoMunicipal,
      DateTime dataNascimento,
      String ddd,
      String telefone,
      String telefone2,
      String celular,
      String cnh,
      String categoriaCNH,
      DateTime vencimentoCNH,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }
      if (aux && await this.isLoggedIn(context)) {
        this.usuario.nome = nome;
        this.usuario.permissionario.rg = rg;
        this.usuario.permissionario.naturalidade = naturalidade;
        this.usuario.permissionario.nacionalidade = nacionalidade;
        this.usuario.permissionario.inscricaoMunicipal = inscricaoMunicipal;
        this.usuario.permissionario.dataNascimento = dataNascimento;
        this.usuario.permissionario.ddd = ddd;
        this.usuario.permissionario.telefone = telefone;
        this.usuario.permissionario.telefone2 = telefone2;
        this.usuario.permissionario.celular = celular;
        this.usuario.permissionario.cnh = cnh;
        this.usuario.permissionario.categoriaCNH = categoriaCNH;
        this.usuario.permissionario.vencimentoCNH = vencimentoCNH;

        if (await _usuarioService.updateUser(this.usuario)) {
          this._reloadUser();
          SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveEndereco(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await this.isLoggedIn(context)) {
        this.usuario.permissionario.endereco.cep = cep;
        this.usuario.permissionario.endereco.endereco = endereco;
        this.usuario.permissionario.endereco.numero = numero;
        this.usuario.permissionario.endereco.complemento = complemento;
        this.usuario.permissionario.endereco.bairro = bairro;
        this.usuario.permissionario.endereco.municipio = municipio;
        this.usuario.permissionario.endereco.uf = uf;

        if (await _usuarioService.updateUser(this.usuario)) {
          this._reloadUser();
          SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> savePassword({String senhaAtual, String senha, String confirmacao, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      bool aux = true;

      if (senha.compareTo(confirmacao) != 0) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "A senha não confere com a confirmação.");
      }

      if (aux) {
        if (await this.isLoggedIn(context)) {
          if (await _usuarioService.updatePassword(senhaAtual: senhaAtual, novaSenha: senha)) {
            this._reloadUser();
            SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
          }
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<bool> isLoggedInWithRedirect({@required BuildContext context, bool redirectToHomeIfLogged = true}) async {
    print("isLoggedInWithRedirect");

    try {
      if (await this.isLoggedIn(context)) {
        if (redirectToHomeIfLogged) {
          print("isLoggedInWithRedirect IF");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        return true;
      } else {
        print("isLoggedInWithRedirect ELSE");
        //this.logout(context: context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return false;
  }

  @action
  Future<void> logout({BuildContext context}) async {
    try {
      _prefs.save(Preferences.KEY_LAST_JWT, null);

      this.photoUser = null;

      await _usuarioService.logout();
    } catch (e) {}

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @action
  Future<File> loadPhotoUser() async {
    try {
      // if(!this.photoUser.existsSync()) {
      //
      //   final lastPhoto = await this._prefs.get(Preferences.KEY_LAST_PHOTO);
      //
      //   if(lastPhoto!=null){
      //     final photo = File(lastPhoto);
      //     if(await photo.exists()){
      //       photo.delete();
      //     }
      //   }
      //   this.photoUser = await this._usuarioService.downloadPhotoUser();
      //
      //   print(photoUser);
      //   this._prefs.save(Preferences.KEY_LAST_PHOTO, this.photoUser.path);
      // }
      // else{
        this.photoUser =  null;
        // print("ELSEEEEEEEE");
        // print(this.photoUser);
        // print(this.photoUser.existsSync());

      //}

    } catch (e) {
      this.photoUser = null;
      print('exception');print(e);
    }
  }

  void showDialogMessageAfterCreateSolicitacao(String startOfMessage, BuildContext context, VoidCallback voidCallback) {
    CustomDialog().showMessegeDialog(
        context: context,
        barrierDismissible: true,
        imageAsset: "images/check-dialog.png",
        height: 340.0,
        text:
        startOfMessage + " Os dados foram enviados para aprovação. É possível visualizar suas solitações pendentes clicando no botão do menu Solicitações",
        voidCallback: voidCallback);
  }

  Future<bool> isLoggedIn(BuildContext context) async {
    this.usuario = await this._usuarioService.getUser();
    return this.usuario != null;
  }

  Future<void> _reloadUser() async {
    this.usuario = await this._usuarioService.getUser();
  }
}
