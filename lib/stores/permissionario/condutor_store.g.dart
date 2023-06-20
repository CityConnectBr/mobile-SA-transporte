// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condutor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CondutorStore on _CondutorStore, Store {
  final _$condutoresAtom = Atom(name: '_CondutorStore.condutores');

  @override
  List<Condutor> get condutores {
    _$condutoresAtom.reportRead();
    return super.condutores;
  }

  @override
  set condutores(List<Condutor> value) {
    _$condutoresAtom.reportWrite(value, super.condutores, () {
      super.condutores = value;
    });
  }

  final _$pesquisarAsyncAction = AsyncAction('_CondutorStore.pesquisar');

  @override
  Future<void> pesquisar(
      {String search,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  final _$firstLoadListAsyncAction =
      AsyncAction('_CondutorStore.firstLoadList');

  @override
  Future<void> firstLoadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  final _$showCondutorAsyncAction = AsyncAction('_CondutorStore.showCondutor');

  @override
  Future<void> showCondutor(
      {Condutor condutor,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showCondutorAsyncAction.run(() => super.showCondutor(
        condutor: condutor, context: context, scaffoldKey: scaffoldKey));
  }

  final _$showAlvaraAsyncAction = AsyncAction('_CondutorStore.showAlvara');

  @override
  Future<void> showAlvara(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showAlvaraAsyncAction.run(
        () => super.showAlvara(context: context, scaffoldKey: scaffoldKey));
  }

  final _$editFotoCondutorAsyncAction =
      AsyncAction('_CondutorStore.editFotoCondutor');

  @override
  Future<void> editFotoCondutor(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoCondutorAsyncAction.run(() =>
        super.editFotoCondutor(context: context, scaffoldKey: scaffoldKey));
  }

  final _$editCondutorAsyncAction = AsyncAction('_CondutorStore.editCondutor');

  @override
  Future<void> editCondutor(
      {BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey,
      int tipoDaSolicitacao,
      Widget screenToOpen}) {
    return _$editCondutorAsyncAction.run(() => super.editCondutor(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  final _$saveFotoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveFotoCondutor');

  @override
  Future<void> saveFotoCondutor(
      {String foto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoCondutorAsyncAction.run(() => super.saveFotoCondutor(
        foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveContatoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveContatoCondutor');

  @override
  Future<void> saveContatoCondutor(
      {String email,
      String ddd,
      String telefone,
      String celular,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveContatoCondutorAsyncAction.run(() => super.saveContatoCondutor(
        email: email,
        ddd: ddd,
        telefone: telefone,
        celular: celular,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$saveIdentidadeCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveIdentidadeCondutor');

  @override
  Future<void> saveIdentidadeCondutor(
      {String nome,
      String cpf,
      String rg,
      String imgComprovante,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveIdentidadeCondutorAsyncAction.run(() => super
        .saveIdentidadeCondutor(
            nome: nome,
            cpf: cpf,
            rg: rg,
            imgComprovante: imgComprovante,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$saveCNHCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveCNHCondutor');

  @override
  Future<void> saveCNHCondutor(
      {String cnh,
      String categoria,
      DateTime validade,
      String imgComprovante,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveCNHCondutorAsyncAction.run(() => super.saveCNHCondutor(
        cnh: cnh,
        categoria: categoria,
        validade: validade,
        imgComprovante: imgComprovante,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$saveEnderecoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveEnderecoCondutor');

  @override
  Future<void> saveEnderecoCondutor(
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
    return _$saveEnderecoCondutorAsyncAction.run(() => super
        .saveEnderecoCondutor(
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

  final _$newCondutorAsyncAction = AsyncAction('_CondutorStore.newCondutor');

  @override
  Future<void> newCondutor(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newCondutorAsyncAction.run(
        () => super.newCondutor(context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveAbaDadosNewCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveAbaDadosNewCondutor');

  @override
  Future<void> saveAbaDadosNewCondutor(
      {String nome,
      String email,
      String cpf,
      String rg,
      String ddd,
      String telefone,
      String celular,
      String cnh,
      String categoriaCNH,
      String imgComprovanteCNH,
      DateTime vencimentoCNH,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveAbaDadosNewCondutorAsyncAction.run(() => super
        .saveAbaDadosNewCondutor(
            nome: nome,
            email: email,
            cpf: cpf,
            rg: rg,
            ddd: ddd,
            telefone: telefone,
            celular: celular,
            cnh: cnh,
            categoriaCNH: categoriaCNH,
            imgComprovanteCNH: imgComprovanteCNH,
            vencimentoCNH: vencimentoCNH,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  final _$saveAbaEnderecoNewCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveAbaEnderecoNewCondutor');

  @override
  Future<void> saveAbaEnderecoNewCondutor(
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
    return _$saveAbaEnderecoNewCondutorAsyncAction.run(() => super
        .saveAbaEnderecoNewCondutor(
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

  final _$loadPhotoFromCondutorAsyncAction =
      AsyncAction('_CondutorStore.loadPhotoFromCondutor');

  @override
  Future<File> loadPhotoFromCondutor(Condutor condutor) {
    return _$loadPhotoFromCondutorAsyncAction
        .run(() => super.loadPhotoFromCondutor(condutor));
  }

  @override
  String toString() {
    return '''
condutores: ${condutores}
    ''';
  }
}
