// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VeiculoStore on _VeiculoStore, Store {
  final _$loadingAtom = Atom(name: '_VeiculoStore.loading');

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

  final _$veiculosAtom = Atom(name: '_VeiculoStore.veiculos');

  @override
  List<Veiculo> get veiculos {
    _$veiculosAtom.reportRead();
    return super.veiculos;
  }

  @override
  set veiculos(List<Veiculo> value) {
    _$veiculosAtom.reportWrite(value, super.veiculos, () {
      super.veiculos = value;
    });
  }

  final _$pesquisarAsyncAction = AsyncAction('_VeiculoStore.pesquisar');

  @override
  Future<void> pesquisar(
      {String search,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  final _$firstLoadListAsyncAction = AsyncAction('_VeiculoStore.firstLoadList');

  @override
  Future<void> firstLoadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  final _$showVeiculoAsyncAction = AsyncAction('_VeiculoStore.showVeiculo');

  @override
  Future<void> showVeiculo(
      {Veiculo veiculo,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showVeiculoAsyncAction.run(() => super.showVeiculo(
        veiculo: veiculo, context: context, scaffoldKey: scaffoldKey));
  }

  final _$editVeiculoAsyncAction = AsyncAction('_VeiculoStore.editVeiculo');

  @override
  Future<void> editVeiculo(
      {BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey,
      Widget screenToOpen}) {
    return _$editVeiculoAsyncAction.run(() => super.editVeiculo(
        context: context,
        scaffoldKey: scaffoldKey,
        screenToOpen: screenToOpen));
  }

  final _$solicitarMultaAsyncAction =
      AsyncAction('_VeiculoStore.solicitarMulta');

  @override
  Future<void> solicitarMulta(
      {BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey,
      int tipoDaSolicitacao,
      Widget screenToOpen}) {
    return _$solicitarMultaAsyncAction.run(() => super.solicitarMulta(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  final _$saveSolicitacaoMultaAsyncAction =
      AsyncAction('_VeiculoStore.saveSolicitacaoMulta');

  @override
  Future<void> saveSolicitacaoMulta(
      {String descricao,
      String data,
      String hora,
      String veiculo_id,
      String imagemVeiculo,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveSolicitacaoMultaAsyncAction.run(() => super
        .saveSolicitacaoMulta(
            descricao: descricao,
            data: data,
            hora: hora,
            veiculo_id: veiculo_id,
            imagemVeiculo: imagemVeiculo,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$newVeiculoAsyncAction = AsyncAction('_VeiculoStore.newVeiculo');

  @override
  Future<void> newVeiculo(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newVeiculoAsyncAction.run(
        () => super.newVeiculo(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveVeiculoAsyncAction = AsyncAction('_VeiculoStore.saveVeiculo');

  @override
  Future<void> saveVeiculo(
      {String placa,
      String renavam,
      String chassi,
      int anoDeFabricacao,
      int anoDoModelo,
      String capacidade,
      String tipoDaCapacidade,
      String observacaoDaCapacidade,
      int anosDeVidaUtilDoVeiculo,
      int marcaModeloVeiculoId,
      int tipoCombustivelId,
      int corId,
      int tipoVeiculoId,
      String documentoFoto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
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

  final _$findMarcaModeloByIdAsyncAction =
      AsyncAction('_VeiculoStore.findMarcaModeloById');

  @override
  Future<MarcaModeloVeiculo> findMarcaModeloById(String id) {
    return _$findMarcaModeloByIdAsyncAction
        .run(() => super.findMarcaModeloById(id));
  }

  final _$findTipoCombustivelByIdAsyncAction =
      AsyncAction('_VeiculoStore.findTipoCombustivelById');

  @override
  Future<TipoCombustivel> findTipoCombustivelById(String id) {
    return _$findTipoCombustivelByIdAsyncAction
        .run(() => super.findTipoCombustivelById(id));
  }

  final _$findTipoVeiculoByIdAsyncAction =
      AsyncAction('_VeiculoStore.findTipoVeiculoById');

  @override
  Future<TipoVeiculo> findTipoVeiculoById(String id) {
    return _$findTipoVeiculoByIdAsyncAction
        .run(() => super.findTipoVeiculoById(id));
  }

  final _$findCorVeiculoByIdAsyncAction =
      AsyncAction('_VeiculoStore.findCorVeiculoById');

  @override
  Future<CorVeiculo> findCorVeiculoById(String id) {
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
