// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infracao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfracaoStore on _InfracaoStore, Store {
  late final _$infracoesAtom =
      Atom(name: '_InfracaoStore.infracoes', context: context);

  @override
  List<Infracao>? get infracoes {
    _$infracoesAtom.reportRead();
    return super.infracoes;
  }

  @override
  set infracoes(List<Infracao>? value) {
    _$infracoesAtom.reportWrite(value, super.infracoes, () {
      super.infracoes = value;
    });
  }

  late final _$loadListAsyncAction =
      AsyncAction('_InfracaoStore.loadList', context: context);

  @override
  Future<void> loadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$loadListAsyncAction
        .run(() => super.loadList(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$pagarAsyncAction =
      AsyncAction('_InfracaoStore.pagar', context: context);

  @override
  Future<void> pagar(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Infracao infracao}) {
    return _$pagarAsyncAction.run(() => super
        .pagar(context: context, scaffoldKey: scaffoldKey, infracao: infracao));
  }

  late final _$_InfracaoStoreActionController =
      ActionController(name: '_InfracaoStore', context: context);

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
