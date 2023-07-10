// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$loadingAtom = Atom(name: '_MainStore.loading', context: context);

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

  late final _$solicitacaoExistenteAtom =
      Atom(name: '_MainStore.solicitacaoExistente', context: context);

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

  late final _$showRecoverCodeFieldAtom =
      Atom(name: '_MainStore.showRecoverCodeField', context: context);

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

  late final _$showRecoverPasswordFieldAtom =
      Atom(name: '_MainStore.showRecoverPasswordField', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('_MainStore.login', context: context);

  @override
  Future<void> login(
      {required String email,
      required String senha,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$loginAsyncAction.run(() => super.login(
        email: email,
        senha: senha,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$signinAsyncAction =
      AsyncAction('_MainStore.signin', context: context);

  @override
  Future<void> signin(
      {required String nome,
      required String email,
      required String cpfCnpj,
      required String cnh,
      required String senha,
      required String confirmacaoDeSenha,
      required bool contratoAceito,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$initPasswordRecoveryAsyncAction =
      AsyncAction('_MainStore.initPasswordRecovery', context: context);

  @override
  Future<void> initPasswordRecovery(
      {required String email,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$initPasswordRecoveryAsyncAction.run(() => super
        .initPasswordRecovery(
            email: email, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$validateRecoveryCodeAsyncAction =
      AsyncAction('_MainStore.validateRecoveryCode', context: context);

  @override
  Future<void> validateRecoveryCode(
      {required String email,
      required String code,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$validateRecoveryCodeAsyncAction.run(() => super
        .validateRecoveryCode(
            email: email,
            code: code,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  late final _$recoveryPasswordAsyncAction =
      AsyncAction('_MainStore.recoveryPassword', context: context);

  @override
  Future<void> recoveryPassword(
      {required String email,
      required String code,
      required String senha,
      required String confirmacaoDeSenha,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$recoveryPasswordAsyncAction.run(() => super.recoveryPassword(
        email: email,
        code: code,
        senha: senha,
        confirmacaoDeSenha: confirmacaoDeSenha,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$editUserAsyncAction =
      AsyncAction('_MainStore.editUser', context: context);

  @override
  Future<void> editUser(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editUserAsyncAction
        .run(() => super.editUser(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveUserAsyncAction =
      AsyncAction('_MainStore.saveUser', context: context);

  @override
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
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$saveEnderecoAsyncAction =
      AsyncAction('_MainStore.saveEndereco', context: context);

  @override
  Future<void> saveEndereco(
      {required String cep,
      required String endereco,
      required String numero,
      required String complemento,
      required String bairro,
      required String municipio,
      required String uf,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$savePasswordAsyncAction =
      AsyncAction('_MainStore.savePassword', context: context);

  @override
  Future<void> savePassword(
      {required String senhaAtual,
      required String senha,
      required String confirmacao,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$savePasswordAsyncAction.run(() => super.savePassword(
        senhaAtual: senhaAtual,
        senha: senha,
        confirmacao: confirmacao,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$isLoggedInWithRedirectAsyncAction =
      AsyncAction('_MainStore.isLoggedInWithRedirect', context: context);

  @override
  Future<bool> isLoggedInWithRedirect(
      {required BuildContext context, bool redirectToHomeIfLogged = true}) {
    return _$isLoggedInWithRedirectAsyncAction.run(() => super
        .isLoggedInWithRedirect(
            context: context, redirectToHomeIfLogged: redirectToHomeIfLogged));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_MainStore.logout', context: context);

  @override
  Future<void> logout({required BuildContext context}) {
    return _$logoutAsyncAction.run(() => super.logout(context: context));
  }

  late final _$loadPhotoUserAsyncAction =
      AsyncAction('_MainStore.loadPhotoUser', context: context);

  @override
  Future<File?> loadPhotoUser() {
    return _$loadPhotoUserAsyncAction.run(() => super.loadPhotoUser());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
solicitacaoExistente: ${solicitacaoExistente},
showRecoverCodeField: ${showRecoverCodeField},
showRecoverPasswordField: ${showRecoverPasswordField}
    ''';
  }
}
