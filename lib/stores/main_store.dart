import 'dart:io';

import 'package:get_it/get_it.dart';
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
  File? photoUser;

  final _usuarioService = UsuarioService();

  final _prefs = Preferences();

  /*@observable
  Usuario usuario;*/

  set usuario(Usuario? value) {
    AppState appState = GetIt.instance.get<AppState>();
    appState.usuarioLogado = value;
  }

  Usuario? get usuario {
    AppState appState = GetIt.instance.get<AppState>();
    return appState.usuarioLogado;
  }

  @action
  Future<void> login(
      {required String email,
      required String senha,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      String? token = await _usuarioService.login(email, senha);

      if (token == null) {
        throw Exception("Token inválido");
      }

      //armazenando token gerado
      await _prefs.save(Preferences.KEY_LAST_JWT, token);

      usuario = await Future.value(_usuarioService.getUser())
          .timeout(const Duration(seconds: 5));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> signin(
      {required String nome,
      required String email,
      required String cpfCnpj,
      required String cnh,
      required String senha,
      required String confirmacaoDeSenha,
      required bool contratoAceito,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    bool aux = true;
    if (senha.compareTo(confirmacaoDeSenha) != 0) {
      aux = false;
      SnackMessages.showSnackBarError(
          context, scaffoldKey, "A senha não confere com a confirmação.");
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
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
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
      {required String email,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await _usuarioService.generateRecoverCode(email)) {
        showRecoverCodeField = true;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> validateRecoveryCode(
      {required String email,
      required String code,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await _usuarioService.validateRecoverCode(email, code)) {
        showRecoverPasswordField = true;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> recoveryPassword(
      {required String email,
      required String code,
      required String senha,
      required String confirmacaoDeSenha,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
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
          showRecoverCodeField = false;
          showRecoverPasswordField = false;

          SnackMessages.showSnackBarSuccess(
              context, scaffoldKey, "Troca de senha efetuada com sucesso!");
        }
      } catch (e) {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
      }
    }

    loading = false;
  }

  @action
  Future<void> editUser(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    if (await isLoggedInWithRedirect(
        context: context, redirectToHomeIfLogged: false)) {
      _reloadUser();

      if (usuario?.permissionario != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PermissionarioUserScreen()));
      } else if (usuario?.condutor != null) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CondutorUserScreen()));
      } else if (usuario?.fiscal != null) {}
    }
  }

  @action
  Future<void> saveUser(
      {required String nome,
      required String rg,
      required String naturalidade,
      required String nacionalidade,
      required String inscricaoMunicipal,
      required DateTime dataNascimento,
      required String ddd,
      required String telefone,
      required String telefone2,
      required String celular,
      required String cnh,
      required String categoriaCNH,
      required DateTime vencimentoCNH,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }
      if (usuario != null && aux && await isLoggedIn(context)) {
        usuario!.nome = nome;

        if (usuario!.permissionario != null) {
          usuario!.permissionario!.rg = rg;
          usuario!.permissionario!.naturalidade = naturalidade;
          usuario!.permissionario!.nacionalidade = nacionalidade;
          usuario!.permissionario!.inscricaoMunicipal = inscricaoMunicipal;
          usuario!.permissionario!.dataNascimento = dataNascimento;
          usuario!.permissionario!.ddd = ddd;
          usuario!.permissionario!.telefone = telefone;
          usuario!.permissionario!.telefone2 = telefone2;
          usuario!.permissionario!.celular = celular;
          usuario!.permissionario!.cnh = cnh;
          usuario!.permissionario!.categoriaCNH = categoriaCNH;
          usuario!.permissionario!.vencimentoCNH = vencimentoCNH;
        }

        if (await _usuarioService.updateUser(usuario!)) {
          _reloadUser();
          SnackMessages.showSnackBarSuccess(
              context, scaffoldKey, "Salvo com sucesso");
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveEndereco(
      {required String cep,
      required String endereco,
      required String numero,
      required String complemento,
      required String bairro,
      required String municipio,
      required String uf,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      if (await isLoggedIn(context)) {
        usuario!.permissionario!.endereco!.cep = cep;
        usuario!.permissionario!.endereco!.endereco = endereco;
        usuario!.permissionario!.endereco!.numero = numero;
        usuario!.permissionario!.endereco!.complemento = complemento;
        usuario!.permissionario!.endereco!.bairro = bairro;
        usuario!.permissionario!.endereco!.municipio = municipio;
        usuario!.permissionario!.endereco!.uf = uf;

        if (await _usuarioService.updateUser(usuario!)) {
          _reloadUser();
          SnackMessages.showSnackBarSuccess(
              context, scaffoldKey, "Salvo com sucesso");
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> savePassword(
      {required String senhaAtual,
      required String senha,
      required String confirmacao,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      bool aux = true;

      if (senha.compareTo(confirmacao) != 0) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "A senha não confere com a confirmação.");
      }

      if (aux) {
        if (await isLoggedIn(context)) {
          if (await _usuarioService.updatePassword(
              senhaAtual: senhaAtual, novaSenha: senha)) {
            _reloadUser();
            SnackMessages.showSnackBarSuccess(
                context, scaffoldKey, "Salvo com sucesso");
          }
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<bool> isLoggedInWithRedirect(
      {required BuildContext context,
      bool redirectToHomeIfLogged = true}) async {
    print("isLoggedInWithRedirect");

    try {
      if (await isLoggedIn(context)) {
        if (redirectToHomeIfLogged) {
          print("isLoggedInWithRedirect IF");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        return true;
      } else {
        print("isLoggedInWithRedirect ELSE");
        //this.logout(context: context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return false;
  }

  @action
  Future<void> logout({required BuildContext context}) async {
    try {
      _prefs.save(Preferences.KEY_LAST_JWT, null);

      photoUser = null;

      await _usuarioService.logout();
    } catch (e) {}

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @action
  Future<File?> loadPhotoUser() async {
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
      photoUser = null;
      // print("ELSEEEEEEEE");
      // print(this.photoUser);
      // print(this.photoUser.existsSync());

      //}
    } catch (e) {
      photoUser = null;
      print('exception');
      print(e);
    }
  }

  void showDialogMessageAfterCreateSolicitacao(
      String startOfMessage, BuildContext context, VoidCallback voidCallback) {
    CustomDialog().showMessegeDialog(
        context: context,
        barrierDismissible: true,
        imageAsset: "images/check-dialog.png",
        height: 340.0,
        text: startOfMessage +
            " Os dados foram enviados para aprovação. É possível visualizar suas solitações pendentes clicando no botão do menu Solicitações",
        voidCallback: voidCallback);
  }

  Future<bool> isLoggedIn(BuildContext context) async {
    usuario = await _usuarioService.getUser();
    return usuario != null;
  }

  Future<void> _reloadUser() async {
    usuario = await _usuarioService.getUser();
  }
}

class AppState {
  Usuario? usuarioLogado;

  File? photoUser;
}
