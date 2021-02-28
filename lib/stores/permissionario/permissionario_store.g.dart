// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissionario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PermissionarioStore on _PermissionarioStore, Store {
  final _$editPermissionarioAsyncAction =
      AsyncAction('_PermissionarioStore.editPermissionario');

  @override
  Future<void> editPermissionario(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      @required int tipoDaSolicitacao,
      Widget screenToOpen}) {
    return _$editPermissionarioAsyncAction.run(() => super.editPermissionario(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  final _$editFotoAsyncAction = AsyncAction('_PermissionarioStore.editFoto');

  @override
  Future<void> editFoto(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoAsyncAction
        .run(() => super.editFoto(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveFotoAsyncAction = AsyncAction('_PermissionarioStore.saveFoto');

  @override
  Future<void> saveFoto(
      {String foto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoAsyncAction.run(() =>
        super.saveFoto(foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
