// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SolicitacaoStore on _SolicitacaoStore, Store {
  late final _$solicitacoesAtom =
      Atom(name: '_SolicitacaoStore.solicitacoes', context: context);

  @override
  List<SolicitacaoDeAlteracao>? get solicitacoes {
    _$solicitacoesAtom.reportRead();
    return super.solicitacoes;
  }

  @override
  set solicitacoes(List<SolicitacaoDeAlteracao>? value) {
    _$solicitacoesAtom.reportWrite(value, super.solicitacoes, () {
      super.solicitacoes = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_SolicitacaoStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$firstLoadListAsyncAction =
      AsyncAction('_SolicitacaoStore.firstLoadList', context: context);

  @override
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''
solicitacoes: ${solicitacoes}
    ''';
  }
}
