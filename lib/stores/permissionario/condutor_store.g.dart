// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condutor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CondutorStore on _CondutorStore, Store {
  late final _$condutoresAtom =
      Atom(name: '_CondutorStore.condutores', context: context);

  @override
  List<Condutor>? get condutores {
    _$condutoresAtom.reportRead();
    return super.condutores;
  }

  @override
  set condutores(List<Condutor>? value) {
    _$condutoresAtom.reportWrite(value, super.condutores, () {
      super.condutores = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_CondutorStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarAsyncAction.run(() => super
        .pesquisar(search: search, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$firstLoadListAsyncAction =
      AsyncAction('_CondutorStore.firstLoadList', context: context);

  @override
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$showCondutorAsyncAction =
      AsyncAction('_CondutorStore.showCondutor', context: context);

  @override
  Future<void> showCondutor(
      {required Condutor condutor,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showCondutorAsyncAction.run(() => super.showCondutor(
        condutor: condutor, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$showAlvaraAsyncAction =
      AsyncAction('_CondutorStore.showAlvara', context: context);

  @override
  Future<void> showAlvara(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$showAlvaraAsyncAction.run(
        () => super.showAlvara(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editFotoCondutorAsyncAction =
      AsyncAction('_CondutorStore.editFotoCondutor', context: context);

  @override
  Future<void> editFotoCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editFotoCondutorAsyncAction.run(() =>
        super.editFotoCondutor(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$editCondutorAsyncAction =
      AsyncAction('_CondutorStore.editCondutor', context: context);

  @override
  Future<void> editCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int tipoDaSolicitacao,
      required Widget screenToOpen}) {
    return _$editCondutorAsyncAction.run(() => super.editCondutor(
        context: context,
        scaffoldKey: scaffoldKey,
        tipoDaSolicitacao: tipoDaSolicitacao,
        screenToOpen: screenToOpen));
  }

  late final _$saveFotoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveFotoCondutor', context: context);

  @override
  Future<void> saveFotoCondutor(
      {required String foto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveFotoCondutorAsyncAction.run(() => super.saveFotoCondutor(
        foto: foto, context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveContatoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveContatoCondutor', context: context);

  @override
  Future<void> saveContatoCondutor(
      {required String email,
      required String ddd,
      required String telefone,
      required String celular,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveContatoCondutorAsyncAction.run(() => super.saveContatoCondutor(
        email: email,
        ddd: ddd,
        telefone: telefone,
        celular: celular,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$saveIdentidadeCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveIdentidadeCondutor', context: context);

  @override
  Future<void> saveIdentidadeCondutor(
      {required String nome,
      required String cpf,
      required String rg,
      required String imgComprovante,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveIdentidadeCondutorAsyncAction.run(() => super
        .saveIdentidadeCondutor(
            nome: nome,
            cpf: cpf,
            rg: rg,
            imgComprovante: imgComprovante,
            context: context,
            scaffoldKey: scaffoldKey));
  }

  late final _$saveCNHCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveCNHCondutor', context: context);

  @override
  Future<void> saveCNHCondutor(
      {required String cnh,
      required String categoria,
      required DateTime validade,
      required String imgComprovante,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveCNHCondutorAsyncAction.run(() => super.saveCNHCondutor(
        cnh: cnh,
        categoria: categoria,
        validade: validade,
        imgComprovante: imgComprovante,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  late final _$saveEnderecoCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveEnderecoCondutor', context: context);

  @override
  Future<void> saveEnderecoCondutor(
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

  late final _$newCondutorAsyncAction =
      AsyncAction('_CondutorStore.newCondutor', context: context);

  @override
  Future<void> newCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newCondutorAsyncAction.run(
        () => super.newCondutor(context: context, scaffoldKey: scaffoldKey));
  }

  late final _$saveAbaDadosNewCondutorAsyncAction =
      AsyncAction('_CondutorStore.saveAbaDadosNewCondutor', context: context);

  @override
  Future<void> saveAbaDadosNewCondutor(
      {required String nome,
      required String email,
      required String cpf,
      required String rg,
      required String ddd,
      required String telefone,
      required String celular,
      required String cnh,
      required String categoriaCNH,
      required String imgComprovanteCNH,
      required DateTime vencimentoCNH,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  late final _$saveAbaEnderecoNewCondutorAsyncAction = AsyncAction(
      '_CondutorStore.saveAbaEnderecoNewCondutor',
      context: context);

  @override
  Future<void> saveAbaEnderecoNewCondutor(
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

  late final _$loadPhotoFromCondutorAsyncAction =
      AsyncAction('_CondutorStore.loadPhotoFromCondutor', context: context);

  @override
  Future<File?> loadPhotoFromCondutor(Condutor condutor) {
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
