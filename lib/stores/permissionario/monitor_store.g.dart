// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MonitorStore on _MonitorStore, Store {
  final _$monitoresAtom = Atom(name: '_MonitorStore.monitores');

  @override
  List<Monitor> get monitores {
    _$monitoresAtom.reportRead();
    return super.monitores;
  }

  @override
  set monitores(List<Monitor> value) {
    _$monitoresAtom.reportWrite(value, super.monitores, () {
      super.monitores = value;
    });
  }

  final _$pesquisarAsyncAction = AsyncAction('_MonitorStore.pesquisar');

  @override
  Future<void> pesquisar(
      {String search,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  final _$firstLoadListAsyncAction = AsyncAction('_MonitorStore.firstLoadList');

  @override
  Future<void> firstLoadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  final _$showMonitorAsyncAction = AsyncAction('_MonitorStore.showMonitor');

  @override
  Future<void> showMonitor(
      {Monitor monitor,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showMonitorAsyncAction.run(() => super.showMonitor(
        monitor: monitor, context: context, scaffoldKey: scaffoldKey));
  }

  final _$editFotoMonitorAsyncAction =
      AsyncAction('_MonitorStore.editFotoMonitor');

  @override
  Future<void> editFotoMonitor(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoMonitorAsyncAction.run(() =>
        super.editFotoMonitor(context: context, scaffoldKey: scaffoldKey));
  }

  final _$editMonitorAsyncAction = AsyncAction('_MonitorStore.editMonitor');

  @override
  Future<void> editMonitor(
      {BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey,
      int tipoDaSolicitacao,
      Widget screenToOpen}) {
    return _$editMonitorAsyncAction.run(() => super.editMonitor(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  final _$saveFotoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveFotoMonitor');

  @override
  Future<void> saveFotoMonitor(
      {String foto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoMonitorAsyncAction.run(() => super.saveFotoMonitor(
        foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveContatoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveContatoMonitor');

  @override
  Future<void> saveContatoMonitor(
      {String email,
      String telefone,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveContatoMonitorAsyncAction.run(() => super.saveContatoMonitor(
        email: email,
        telefone: telefone,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$saveIdentidadeMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveIdentidadeMonitor');

  @override
  Future<void> saveIdentidadeMonitor(
      {String nome,
      String cpf,
      String rg,
      String imgComprovante,
      DateTime dataNasc,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveIdentidadeMonitorAsyncAction.run(() => super
        .saveIdentidadeMonitor(
            nome: nome,
            cpf: cpf,
            rg: rg,
            imgComprovante: imgComprovante,
            dataNasc: dataNasc,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$saveEnderecoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveEnderecoMonitor');

  @override
  Future<void> saveEnderecoMonitor(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      String imgComprovanteEndereco,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveEnderecoMonitorAsyncAction.run(() => super.saveEnderecoMonitor(
        cep: cep,
        endereco: endereco,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        municipio: municipio,
        uf: uf,
        imgComprovanteEndereco: imgComprovanteEndereco,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$newMonitorAsyncAction = AsyncAction('_MonitorStore.newMonitor');

  @override
  Future<void> newMonitor(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newMonitorAsyncAction.run(
        () => super.newMonitor(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveAbaDadosNewMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveAbaDadosNewMonitor');

  @override
  Future<void> saveAbaDadosNewMonitor(
      {String nome,
      String email,
      String cpf,
      String rg,
      String telefone,
      String imgComprovante,
      DateTime dataNasc,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveAbaDadosNewMonitorAsyncAction.run(() => super
        .saveAbaDadosNewMonitor(
            nome: nome,
            email: email,
            cpf: cpf,
            rg: rg,
            telefone: telefone,
            imgComprovante: imgComprovante,
            dataNasc: dataNasc,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$saveAbaEnderecoNewMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveAbaEnderecoNewMonitor');

  @override
  Future<void> saveAbaEnderecoNewMonitor(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      String imgComprovanteEndereco,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveAbaEnderecoNewMonitorAsyncAction.run(() => super
        .saveAbaEnderecoNewMonitor(
            cep: cep,
            endereco: endereco,
            numero: numero,
            complemento: complemento,
            bairro: bairro,
            municipio: municipio,
            uf: uf,
            imgComprovanteEndereco: imgComprovanteEndereco,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$loadPhotoFromMonitorAsyncAction =
      AsyncAction('_MonitorStore.loadPhotoFromMonitor');

  @override
  Future<File> loadPhotoFromMonitor(Monitor monitor) {
    return _$loadPhotoFromMonitorAsyncAction
        .run(() => super.loadPhotoFromMonitor(monitor));
  }

  @override
  String toString() {
    return '''
monitores: ${monitores}
    ''';
  }
}
