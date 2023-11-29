// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_alvara_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParamengoAlvaraStore on _ParamengoAlvaraStore, Store {
  late final _$alvaraAtom =
      Atom(name: '_ParamengoAlvaraStore.alvara', context: context);

  @override
  Alvara? get alvara {
    _$alvaraAtom.reportRead();
    return super.alvara;
  }

  @override
  set alvara(Alvara? value) {
    _$alvaraAtom.reportWrite(value, super.alvara, () {
      super.alvara = value;
    });
  }

  late final _$loadAlvaraAsyncAction =
      AsyncAction('_ParamengoAlvaraStore.loadAlvara', context: context);

  @override
  Future<void> loadAlvara(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int alvaraId}) {
    return _$loadAlvaraAsyncAction.run(() => super.loadAlvara(
        context: context, scaffoldKey: scaffoldKey, alvaraId: alvaraId));
  }

  late final _$informarPagamentoAsyncAction =
      AsyncAction('_ParamengoAlvaraStore.informarPagamento', context: context);

  @override
  Future<void> informarPagamento(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Alvara alvara}) {
    return _$informarPagamentoAsyncAction.run(() => super.informarPagamento(
        context: context, scaffoldKey: scaffoldKey, alvara: alvara));
  }

  late final _$_ParamengoAlvaraStoreActionController =
      ActionController(name: '_ParamengoAlvaraStore', context: context);

  @override
  String gerarPIX(Alvara alvara) {
    final _$actionInfo = _$_ParamengoAlvaraStoreActionController.startAction(
        name: '_ParamengoAlvaraStore.gerarPIX');
    try {
      return super.gerarPIX(alvara);
    } finally {
      _$_ParamengoAlvaraStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void copyToClipboard(
      String text, BuildContext context, GlobalKey<State<StatefulWidget>> key) {
    final _$actionInfo = _$_ParamengoAlvaraStoreActionController.startAction(
        name: '_ParamengoAlvaraStore.copyToClipboard');
    try {
      return super.copyToClipboard(text, context, key);
    } finally {
      _$_ParamengoAlvaraStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alvara: ${alvara}
    ''';
  }
}
