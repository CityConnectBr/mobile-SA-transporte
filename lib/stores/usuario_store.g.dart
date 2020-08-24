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

  final _$isLoggedInAsyncAction = AsyncAction('_UsuarioStore.isLoggedIn');

  @override
  Future<void> isLoggedIn(BuildContext context) {
    return _$isLoggedInAsyncAction.run(() => super.isLoggedIn(context));
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

  final _$logoutAsyncAction = AsyncAction('_UsuarioStore.logout');

  @override
  Future<void> logout(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$logoutAsyncAction
        .run(() => super.logout(context: context, scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usuario: ${usuario}
    ''';
  }
}
