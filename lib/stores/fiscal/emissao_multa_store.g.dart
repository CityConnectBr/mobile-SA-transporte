// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emissao_multa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmissaoMultaStore on _EmissaoMultaStore, Store {
  late final _$criarSolicitacaoDeInfracaoAsyncAction = AsyncAction(
      '_EmissaoMultaStore.criarSolicitacaoDeInfracao',
      context: context);

  @override
  Future<void> criarSolicitacaoDeInfracao(
      {required Veiculo veiculo,
      required DateTime data,
      required String hora,
      required String descricao,
      required String foto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$criarSolicitacaoDeInfracaoAsyncAction.run(() => super
        .criarSolicitacaoDeInfracao(
            veiculo: veiculo,
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
