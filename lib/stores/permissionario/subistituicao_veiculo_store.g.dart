// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subistituicao_veiculo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubstituicaoVeiculoStore on _SubstituicaoVeiculoStore, Store {
  late final _$loadingAtom =
      Atom(name: '_SubstituicaoVeiculoStore.loading', context: context);

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

  late final _$solicitarSubstituicaoVeiculoEscolarAsyncAction = AsyncAction(
      '_SubstituicaoVeiculoStore.solicitarSubstituicaoVeiculoEscolar',
      context: context);

  @override
  Future<void> solicitarSubstituicaoVeiculoEscolar(
      {required String? veiculoId,
      required String? fotoVeiculo,
      required String? fotoIPVA,
      required String? fotoCRLV,
      required String? fotoLaudoTacografo,
      required String? fotoAutorizacaoCIRETRAN,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$solicitarSubstituicaoVeiculoEscolarAsyncAction.run(() => super
        .solicitarSubstituicaoVeiculoEscolar(
            veiculoId: veiculoId,
            fotoVeiculo: fotoVeiculo,
            fotoIPVA: fotoIPVA,
            fotoCRLV: fotoCRLV,
            fotoLaudoTacografo: fotoLaudoTacografo,
            fotoAutorizacaoCIRETRAN: fotoAutorizacaoCIRETRAN,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  late final _$solicitarSubstituicaoVeiculoTaxiAsyncAction = AsyncAction(
      '_SubstituicaoVeiculoStore.solicitarSubstituicaoVeiculoTaxi',
      context: context);

  @override
  Future<void> solicitarSubstituicaoVeiculoTaxi(
      {required String? veiculoId,
      required String? fotoCRLV,
      required String? fotoComprovanteRetiradaTaximetroAfericao,
      required String? fotoSeloGas,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$solicitarSubstituicaoVeiculoTaxiAsyncAction.run(() => super
        .solicitarSubstituicaoVeiculoTaxi(
            veiculoId: veiculoId,
            fotoCRLV: fotoCRLV,
            fotoComprovanteRetiradaTaximetroAfericao:
                fotoComprovanteRetiradaTaximetroAfericao,
            fotoSeloGas: fotoSeloGas,
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
