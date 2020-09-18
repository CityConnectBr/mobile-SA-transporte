// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioStore on _UsuarioStore, Store {
  final _$loadingAtom = Atom(name: '_UsuarioStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$showRecoverCodeFieldAtom =
      Atom(name: '_UsuarioStore.showRecoverCodeField');

  @override
  bool get showRecoverCodeField {
    _$showRecoverCodeFieldAtom.reportRead();
    return super.showRecoverCodeField;
  }

  @override
  set showRecoverCodeField(bool value) {
    _$showRecoverCodeFieldAtom.reportWrite(value, super.showRecoverCodeField,
        () {
      super.showRecoverCodeField = value;
    });
  }

  final _$showRecoverPasswordFieldAtom =
      Atom(name: '_UsuarioStore.showRecoverPasswordField');

  @override
  bool get showRecoverPasswordField {
    _$showRecoverPasswordFieldAtom.reportRead();
    return super.showRecoverPasswordField;
  }

  @override
  set showRecoverPasswordField(bool value) {
    _$showRecoverPasswordFieldAtom
        .reportWrite(value, super.showRecoverPasswordField, () {
      super.showRecoverPasswordField = value;
    });
  }

  final _$usuarioAtom = Atom(name: '_UsuarioStore.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$isLoggedInWithRedirectAsyncAction =
      AsyncAction('_UsuarioStore.isLoggedInWithRedirect');

  @override
  Future<bool> isLoggedInWithRedirect(
      {@required BuildContext context, bool redirectToHomeIfLogged = true}) {
    return _$isLoggedInWithRedirectAsyncAction.run(() => super
        .isLoggedInWithRedirect(
            context: context, redirectToHomeIfLogged: redirectToHomeIfLogged));
  }

  final _$loginAsyncAction = AsyncAction('_UsuarioStore.login');

  @override
  Future<void> login(
      {String email,
      String senha,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$loginAsyncAction.run(() => super.login(
        email: email,
        senha: senha,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$signinAsyncAction = AsyncAction('_UsuarioStore.signin');

  @override
  Future<void> signin(
      {String nome,
      String email,
      String cpfCnpj,
      String cnh,
      String senha,
      String confirmacaoDeSenha,
      bool contratoAceito,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$signinAsyncAction.run(() => super.signin(
        nome: nome,
        email: email,
        cpfCnpj: cpfCnpj,
        cnh: cnh,
        senha: senha,
        confirmacaoDeSenha: confirmacaoDeSenha,
        contratoAceito: contratoAceito,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$initPasswordRecoveryAsyncAction =
      AsyncAction('_UsuarioStore.initPasswordRecovery');

  @override
  Future<void> initPasswordRecovery(
      {String email,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$initPasswordRecoveryAsyncAction.run(() => super
        .initPasswordRecovery(
            email: email, context: context, scaffoldKey: scaffoldKey));
  }

  final _$validateRecoveryCodeAsyncAction =
      AsyncAction('_UsuarioStore.validateRecoveryCode');

  @override
  Future<void> validateRecoveryCode(
      {String email,
      String code,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$validateRecoveryCodeAsyncAction.run(() => super
        .validateRecoveryCode(
            email: email,
            code: code,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$recoveryPasswordAsyncAction =
      AsyncAction('_UsuarioStore.recoveryPassword');

  @override
  Future<void> recoveryPassword(
      {String email,
      String code,
      String senha,
      String confirmacaoDeSenha,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$recoveryPasswordAsyncAction.run(() => super.recoveryPassword(
        email: email,
        code: code,
        senha: senha,
        confirmacaoDeSenha: confirmacaoDeSenha,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$editUserAsyncAction = AsyncAction('_UsuarioStore.editUser');

  @override
  Future<void> editUser(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editUserAsyncAction
        .run(() => super.editUser(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveUserAsyncAction = AsyncAction('_UsuarioStore.saveUser');

  @override
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
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveUserAsyncAction.run(() => super.saveUser(
        nome: nome,
        rg: rg,
        naturalidade: naturalidade,
        nacionalidade: nacionalidade,
        inscricaoMunicipal: inscricaoMunicipal,
        dataNascimento: dataNascimento,
        ddd: ddd,
        telefone: telefone,
        telefone2: telefone2,
        celular: celular,
        cnh: cnh,
        categoriaCNH: categoriaCNH,
        vencimentoCNH: vencimentoCNH,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$logoutAsyncAction = AsyncAction('_UsuarioStore.logout');

  @override
  Future<void> logout({BuildContext context}) {
    return _$logoutAsyncAction.run(() => super.logout(context: context));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
showRecoverCodeField: ${showRecoverCodeField},
showRecoverPasswordField: ${showRecoverPasswordField},
usuario: ${usuario}
    ''';
  }
}
