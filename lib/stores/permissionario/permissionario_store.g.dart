// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissionario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PermissionarioStore on _PermissionarioStore, Store {
  late final _$permissionariosAtom =
      Atom(name: '_PermissionarioStore.permissionarios', context: context);

  @override
  List<Permissionario>? get permissionarios {
    _$permissionariosAtom.reportRead();
    return super.permissionarios;
  }

  @override
  set permissionarios(List<Permissionario>? value) {
    _$permissionariosAtom.reportWrite(value, super.permissionarios, () {
      super.permissionarios = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_PermissionarioStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editPermissionarioAsyncAction =
      AsyncAction('_PermissionarioStore.editPermissionario', context: context);

  @override
  Future<void> editPermissionario(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int tipoDaSolicitacao,
      required Widget screenToOpen}) {
    return _$editPermissionarioAsyncAction.run(() => super.editPermissionario(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  late final _$editFotoAsyncAction =
      AsyncAction('_PermissionarioStore.editFoto', context: context);

  @override
  Future<void> editFoto(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoAsyncAction
        .run(() => super.editFoto(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$showAlvaraAsyncAction =
      AsyncAction('_PermissionarioStore.showAlvara', context: context);

  @override
  Future<void> showAlvara(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showAlvaraAsyncAction.run(
        () => super.showAlvara(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveFotoAsyncAction =
      AsyncAction('_PermissionarioStore.saveFoto', context: context);

  @override
  Future<void> saveFoto(
      {required String foto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoAsyncAction.run(() =>
        super.saveFoto(foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$solicitarRenovacaoAlvaraAsyncAction = AsyncAction(
      '_PermissionarioStore.solicitarRenovacaoAlvara',
      context: context);

  @override
  Future<void> solicitarRenovacaoAlvara({required BuildContext context}) {
    return _$solicitarRenovacaoAlvaraAsyncAction
        .run(() => super.solicitarRenovacaoAlvara(context: context));
  }

  @override
  String toString() {
    return '''
permissionarios: ${permissionarios}
    ''';
  }
}
