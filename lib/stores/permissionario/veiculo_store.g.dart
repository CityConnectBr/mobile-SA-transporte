// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VeiculoStore on _VeiculoStore, Store {
  late final _$loadingAtom =
      Atom(name: '_VeiculoStore.loading', context: context);

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

  late final _$veiculosAtom =
      Atom(name: '_VeiculoStore.veiculos', context: context);

  @override
  List<Veiculo>? get veiculos {
    _$veiculosAtom.reportRead();
    return super.veiculos;
  }

  @override
  set veiculos(List<Veiculo>? value) {
    _$veiculosAtom.reportWrite(value, super.veiculos, () {
      super.veiculos = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_VeiculoStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$firstLoadListAsyncAction =
      AsyncAction('_VeiculoStore.firstLoadList', context: context);

  @override
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$showVeiculoAsyncAction =
      AsyncAction('_VeiculoStore.showVeiculo', context: context);

  @override
  Future<void> showVeiculo(
      {required Veiculo veiculo,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showVeiculoAsyncAction.run(() => super.showVeiculo(
        veiculo: veiculo, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editVeiculoAsyncAction =
      AsyncAction('_VeiculoStore.editVeiculo', context: context);

  @override
  Future<void> editVeiculo(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Widget screenToOpen}) {
    return _$editVeiculoAsyncAction.run(() => super.editVeiculo(
        context: context,
        scaffoldKey: scaffoldKey,
        screenToOpen: screenToOpen));
  }

  late final _$newVeiculoAsyncAction =
      AsyncAction('_VeiculoStore.newVeiculo', context: context);

  @override
  Future<void> newVeiculo(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newVeiculoAsyncAction.run(
        () => super.newVeiculo(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveVeiculoAsyncAction =
      AsyncAction('_VeiculoStore.saveVeiculo', context: context);

  @override
  Future<void> saveVeiculo(
      {required String placa,
      required String renavam,
      required String chassi,
      required int anoDeFabricacao,
      required int anoDoModelo,
      required String capacidade,
      required String tipoDaCapacidade,
      required String observacaoDaCapacidade,
      required int anosDeVidaUtilDoVeiculo,
      required int marcaModeloVeiculoId,
      required int tipoCombustivelId,
      required int corId,
      required int tipoVeiculoId,
      required String documentoFoto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveVeiculoAsyncAction.run(() => super.saveVeiculo(
        placa: placa,
        renavam: renavam,
        chassi: chassi,
        anoDeFabricacao: anoDeFabricacao,
        anoDoModelo: anoDoModelo,
        capacidade: capacidade,
        tipoDaCapacidade: tipoDaCapacidade,
        observacaoDaCapacidade: observacaoDaCapacidade,
        anosDeVidaUtilDoVeiculo: anosDeVidaUtilDoVeiculo,
        marcaModeloVeiculoId: marcaModeloVeiculoId,
        tipoCombustivelId: tipoCombustivelId,
        corId: corId,
        tipoVeiculoId: tipoVeiculoId,
        documentoFoto: documentoFoto,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$findMarcaModeloByIdAsyncAction =
      AsyncAction('_VeiculoStore.findMarcaModeloById', context: context);

  @override
  Future<MarcaModeloVeiculo?> findMarcaModeloById(String id) {
    return _$findMarcaModeloByIdAsyncAction
        .run(() => super.findMarcaModeloById(id));
  }

  late final _$findTipoCombustivelByIdAsyncAction =
      AsyncAction('_VeiculoStore.findTipoCombustivelById', context: context);

  @override
  Future<TipoCombustivel?> findTipoCombustivelById(String id) {
    return _$findTipoCombustivelByIdAsyncAction
        .run(() => super.findTipoCombustivelById(id));
  }

  late final _$findTipoVeiculoByIdAsyncAction =
      AsyncAction('_VeiculoStore.findTipoVeiculoById', context: context);

  @override
  Future<TipoVeiculo?> findTipoVeiculoById(String id) {
    return _$findTipoVeiculoByIdAsyncAction
        .run(() => super.findTipoVeiculoById(id));
  }

  late final _$findCorVeiculoByIdAsyncAction =
      AsyncAction('_VeiculoStore.findCorVeiculoById', context: context);

  @override
  Future<CorVeiculo?> findCorVeiculoById(String id) {
    return _$findCorVeiculoByIdAsyncAction
        .run(() => super.findCorVeiculoById(id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
veiculos: ${veiculos}
    ''';
  }
}
