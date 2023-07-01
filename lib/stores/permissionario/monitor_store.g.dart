// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MonitorStore on _MonitorStore, Store {
  late final _$monitoresAtom =
      Atom(name: '_MonitorStore.monitores', context: context);

  @override
  List<Monitor>? get monitores {
    _$monitoresAtom.reportRead();
    return super.monitores;
  }

  @override
  set monitores(List<Monitor>? value) {
    _$monitoresAtom.reportWrite(value, super.monitores, () {
      super.monitores = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_MonitorStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$firstLoadListAsyncAction =
      AsyncAction('_MonitorStore.firstLoadList', context: context);

  @override
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$showMonitorAsyncAction =
      AsyncAction('_MonitorStore.showMonitor', context: context);

  @override
  Future<void> showMonitor(
      {required Monitor monitor,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showMonitorAsyncAction.run(() => super.showMonitor(
        monitor: monitor, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editFotoMonitorAsyncAction =
      AsyncAction('_MonitorStore.editFotoMonitor', context: context);

  @override
  Future<void> editFotoMonitor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoMonitorAsyncAction.run(() =>
        super.editFotoMonitor(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editMonitorAsyncAction =
      AsyncAction('_MonitorStore.editMonitor', context: context);

  @override
  Future<void> editMonitor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int tipoDaSolicitacao,
      required Widget screenToOpen}) {
    return _$editMonitorAsyncAction.run(() => super.editMonitor(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  late final _$saveFotoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveFotoMonitor', context: context);

  @override
  Future<void> saveFotoMonitor(
      {required String foto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoMonitorAsyncAction.run(() => super.saveFotoMonitor(
        foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveContatoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveContatoMonitor', context: context);

  @override
  Future<void> saveContatoMonitor(
      {required String email,
      required String telefone,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveContatoMonitorAsyncAction.run(() => super.saveContatoMonitor(
        email: email,
        telefone: telefone,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$saveIdentidadeMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveIdentidadeMonitor', context: context);

  @override
  Future<void> saveIdentidadeMonitor(
      {required String nome,
      required String cpf,
      required String rg,
      required String imgComprovante,
      required DateTime dataNasc,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$saveEnderecoMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveEnderecoMonitor', context: context);

  @override
  Future<void> saveEnderecoMonitor(
      {required String cep,
      required String endereco,
      required String numero,
      required String complemento,
      required String bairro,
      required String municipio,
      required String uf,
      required String imgComprovanteEndereco,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$newMonitorAsyncAction =
      AsyncAction('_MonitorStore.newMonitor', context: context);

  @override
  Future<void> newMonitor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newMonitorAsyncAction.run(
        () => super.newMonitor(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveAbaDadosNewMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveAbaDadosNewMonitor', context: context);

  @override
  Future<void> saveAbaDadosNewMonitor(
      {required String nome,
      required String email,
      required String cpf,
      required String rg,
      required String telefone,
      required String imgComprovante,
      required DateTime dataNasc,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$saveAbaEnderecoNewMonitorAsyncAction =
      AsyncAction('_MonitorStore.saveAbaEnderecoNewMonitor', context: context);

  @override
  Future<void> saveAbaEnderecoNewMonitor(
      {required String cep,
      required String endereco,
      required String numero,
      required String complemento,
      required String bairro,
      required String municipio,
      required String uf,
      required String imgComprovanteEndereco,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$loadPhotoFromMonitorAsyncAction =
      AsyncAction('_MonitorStore.loadPhotoFromMonitor', context: context);

  @override
  Future<File?> loadPhotoFromMonitor(Monitor monitor) {
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
