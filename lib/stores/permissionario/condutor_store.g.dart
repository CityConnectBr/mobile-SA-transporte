// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condutor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CondutorStore on _CondutorStore, Store {
  final _$loadingAtom = Atom(name: '_CondutorStore.loading');

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

  final _$pesquisarCondutoresAsyncAction =
      AsyncAction('_CondutorStore.pesquisarCondutores');

  @override
  Future<void> pesquisarCondutores(
      {String search,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$pesquisarCondutoresAsyncAction.run(() => super.pesquisarCondutores(
        search: search, context: context, scaffoldKey: scaffoldKey));
  }

  final _$firstLoadListAsyncAction =
      AsyncAction('_CondutorStore.firstLoadList');

  @override
  Future<void> firstLoadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$firstLoadListAsyncAction.run(
        () => super.firstLoadList(context: context, scaffoldKey: scaffoldKey));
  }

  final _$newCondutorAsyncAction = AsyncAction('_CondutorStore.newCondutor');

  @override
  Future<void> newCondutor(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$newCondutorAsyncAction.run(
        () => super.newCondutor(context: context, scaffoldKey: scaffoldKey));
  }

  final _$editCondutorAsyncAction = AsyncAction('_CondutorStore.editCondutor');

  @override
  Future<void> editCondutor(
      {@required Condutor condutor,
      @required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editCondutorAsyncAction.run(() => super.editCondutor(
        condutor: condutor, context: context, scaffoldKey: scaffoldKey));
  }

  final _$saveAsyncAction = AsyncAction('_CondutorStore.save');

  @override
  Future<void> save(
      {String nome,
      String email,
      String cpf,
      String rg,
      String naturalidade,
      String nacionalidade,
      DateTime dataNascimento,
      String ddd,
      String telefone,
      String celular,
      String cnh,
      String categoriaCNH,
      DateTime vencimentoCNH,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveAsyncAction.run(() => super.save(
        nome: nome,
        email: email,
        cpf: cpf,
        rg: rg,
        naturalidade: naturalidade,
        nacionalidade: nacionalidade,
        dataNascimento: dataNascimento,
        ddd: ddd,
        telefone: telefone,
        celular: celular,
        cnh: cnh,
        categoriaCNH: categoriaCNH,
        vencimentoCNH: vencimentoCNH,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  final _$saveEnderecoAsyncAction = AsyncAction('_CondutorStore.saveEndereco');

  @override
  Future<void> saveEndereco(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$saveEnderecoAsyncAction.run(() => super.saveEndereco(
        cep: cep,
        endereco: endereco,
        numero: numero,
        complemento: complemento,
        bairro: bairro,
        municipio: municipio,
        uf: uf,
        context: context,
        scaffoldKey: scaffoldKey));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
condutores: ${condutores}
    ''';
  }
}
