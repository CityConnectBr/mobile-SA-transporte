// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emissao_multa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmissaoMultaStore on _EmissaoMultaStore, Store {
  final _$criarSolicitacaoDeInfracaoAsyncAction =
      AsyncAction('_EmissaoMultaStore.criarSolicitacaoDeInfracao');

  @override
  Future<void> criarSolicitacaoDeInfracao(
      {DateTime data,
      String hora,
      String descricao,
      String foto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$criarSolicitacaoDeInfracaoAsyncAction.run(() => super
        .criarSolicitacaoDeInfracao(
            data: data,
            hora: hora,
            descricao: descricao,
            foto: foto,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
