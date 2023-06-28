// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infracao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfracaoStore on _InfracaoStore, Store {
  final _$infracoesAtom = Atom(name: '_InfracaoStore.infracoes');

  @override
  List<Infracao> get infracoes {
    _$infracoesAtom.reportRead();
    return super.infracoes;
  }

  @override
  set infracoes(List<Infracao> value) {
    _$infracoesAtom.reportWrite(value, super.infracoes, () {
      super.infracoes = value;
    });
  }

  final _$loadListAsyncAction = AsyncAction('_InfracaoStore.loadList');

  @override
  Future<void> loadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$loadListAsyncAction
        .run(() => super.loadList(context: context, scaffoldKey: scaffoldKey));
  }

  final _$pagarAsyncAction = AsyncAction('_InfracaoStore.pagar');

  @override
  Future<void> pagar(
      {BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey,
      Infracao infracao}) {
    return _$pagarAsyncAction.run(() => super
        .pagar(context: context, scaffoldKey: scaffoldKey, infracao: infracao));
  }

  final _$_InfracaoStoreActionController =
      ActionController(name: '_InfracaoStore');

  @override
  String gerarPIX(Infracao infracao) {
    final _$actionInfo = _$_InfracaoStoreActionController.startAction(
        name: '_InfracaoStore.gerarPIX');
    try {
      return super.gerarPIX(infracao);
    } finally {
      _$_InfracaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void copyToClipboard(
      String text, BuildContext context, GlobalKey<State<StatefulWidget>> key) {
    final _$actionInfo = _$_InfracaoStoreActionController.startAction(
        name: '_InfracaoStore.copyToClipboard');
    try {
      return super.copyToClipboard(text, context, key);
    } finally {
      _$_InfracaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infracoes: ${infracoes}
    ''';
  }
}
