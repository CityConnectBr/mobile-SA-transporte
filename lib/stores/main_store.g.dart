// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$loadingAtom = Atom(name: '_MainStore.loading');

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

  final _$solicitacaoExistenteAtom =
      Atom(name: '_MainStore.solicitacaoExistente');

  @override
  bool get solicitacaoExistente {
    _$solicitacaoExistenteAtom.reportRead();
    return super.solicitacaoExistente;
  }

  @override
  set solicitacaoExistente(bool value) {
    _$solicitacaoExistenteAtom.reportWrite(value, super.solicitacaoExistente,
        () {
      super.solicitacaoExistente = value;
    });
  }

  final _$showRecoverCodeFieldAtom =
      Atom(name: '_MainStore.showRecoverCodeField');

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
      Atom(name: '_MainStore.showRecoverPasswordField');

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

  final _$usuarioAtom = Atom(name: '_MainStore.usuario');

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

  final _$loginAsyncAction = AsyncAction('_MainStore.login');

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

  final _$signinAsyncAction = AsyncAction('_MainStore.signin');

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
      AsyncAction('_MainStore.initPasswordRecovery');

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
      AsyncAction('_MainStore.validateRecoveryCode');

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
      AsyncAction('_MainStore.recoveryPassword');

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

  final _$editUserAsyncAction = AsyncAction('_MainStore.editUser');

  @override
  Future<void> editUser(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editUserAsyncAction
        .run(() => super.editUser(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveUserAsyncAction = AsyncAction('_MainStore.saveUser');

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

  final _$saveEnderecoAsyncAction = AsyncAction('_MainStore.saveEndereco');

  @override
  Future<void> saveEndereco(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveEnderecoAsyncAction.run(() => super.saveEndereco(
        cep: cep,
        endereco: endereco,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        municipio: municipio,
        uf: uf,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$savePasswordAsyncAction = AsyncAction('_MainStore.savePassword');

  @override
  Future<void> savePassword(
      {String senhaAtual,
      String senha,
      String confirmacao,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$savePasswordAsyncAction.run(() => super.savePassword(
        senhaAtual: senhaAtual,
        senha: senha,
        confirmacao: confirmacao,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$isLoggedInWithRedirectAsyncAction =
      AsyncAction('_MainStore.isLoggedInWithRedirect');

  @override
  Future<bool> isLoggedInWithRedirect(
      {@required BuildContext context, bool redirectToHomeIfLogged = true}) {
    return _$isLoggedInWithRedirectAsyncAction.run(() => super
        .isLoggedInWithRedirect(
            context: context, redirectToHomeIfLogged: redirectToHomeIfLogged));
  }

  final _$logoutAsyncAction = AsyncAction('_MainStore.logout');

  @override
  Future<void> logout({BuildContext context}) {
    return _$logoutAsyncAction.run(() => super.logout(context: context));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
solicitacaoExistente: ${solicitacaoExistente},
showRecoverCodeField: ${showRecoverCodeField},
showRecoverPasswordField: ${showRecoverPasswordField},
usuario: ${usuario}
    ''';
  }
}
