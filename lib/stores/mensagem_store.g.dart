// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagem_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MensagemStore on _MensagemStore, Store {
  late final _$listAtom = Atom(name: '_MensagemStore.list', context: context);

  @override
  List<dynamic> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<dynamic> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_MensagemStoreActionController =
      ActionController(name: '_MensagemStore', context: context);

  @override
  void loadMensagens() {
    final _$actionInfo = _$_MensagemStoreActionController.startAction(
        name: '_MensagemStore.loadMensagens');
    try {
      return super.loadMensagens();
    } finally {
      _$_MensagemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMensagens() {
    final _$actionInfo = _$_MensagemStoreActionController.startAction(
        name: '_MensagemStore.clearMensagens');
    try {
      return super.clearMensagens();
    } finally {
      _$_MensagemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
