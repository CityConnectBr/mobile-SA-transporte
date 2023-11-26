// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_alvara_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SolicitacaoAlvaraStore on _SolicitacaoAlvaraStore, Store {
  late final _$loadingAtom =
      Atom(name: '_SolicitacaoAlvaraStore.loading', context: context);

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

  late final _$solicitarNovoAlvaraAsyncAction = AsyncAction(
      '_SolicitacaoAlvaraStore.solicitarNovoAlvara',
      context: context);

  @override
  Future<void> solicitarNovoAlvara(
      {required bool? possuiGNV,
      required DateTime? dataVencimentoGNV,
      required bool? ocorreuMudancaEndereco,
      required DateTime? dataVencimentoCNH,
      required DateTime? dataVencimentoDistribuicaoCriminal,
      required String? fotoCRLV,
      required String? fotoComprovanteAfericaoTaximetro,
      required String? fotoComprovanteResidencia,
      required String? fotoCNH,
      required String? fotoComprovanteLaudoVistoria,
      required String? fotoComprovanteDistribuicaoCriminal,
      required String? fotoGNV,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$solicitarNovoAlvaraAsyncAction.run(() => super.solicitarNovoAlvara(
        possuiGNV: possuiGNV,
        dataVencimentoGNV: dataVencimentoGNV,
        ocorreuMudancaEndereco: ocorreuMudancaEndereco,
        dataVencimentoCNH: dataVencimentoCNH,
        dataVencimentoDistribuicaoCriminal: dataVencimentoDistribuicaoCriminal,
        fotoCRLV: fotoCRLV,
        fotoComprovanteAfericaoTaximetro: fotoComprovanteAfericaoTaximetro,
        fotoComprovanteResidencia: fotoComprovanteResidencia,
        fotoCNH: fotoCNH,
        fotoComprovanteLaudoVistoria: fotoComprovanteLaudoVistoria,
        fotoComprovanteDistribuicaoCriminal:
            fotoComprovanteDistribuicaoCriminal,
        fotoGNV: fotoGNV,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
