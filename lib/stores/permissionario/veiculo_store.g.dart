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
      {@required Veiculo veiculo,
      @required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showVeiculoAsyncAction.run(() => super.showVeiculo(
        veiculo: veiculo, context: context, scaffoldKey: scaffoldKey));
  }

  final _$editVeiculoAsyncAction = AsyncAction('_VeiculoStore.editVeiculo');

  @override
  Future<void> editVeiculo(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      Widget screenToOpen}) {
    return _$editVeiculoAsyncAction.run(() => super.editVeiculo(
        context: context,
        scaffoldKey: scaffoldKey,
        screenToOpen: screenToOpen));
  }

  final _$newVeiculoAsyncAction = AsyncAction('_VeiculoStore.newVeiculo');

  @override
  Future<void> newVeiculo(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newVeiculoAsyncAction.run(
        () => super.newVeiculo(context: context, scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
veiculos: ${veiculos}
    ''';
  }
}
