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

  final _$editCondutorAsyncAction = AsyncAction('_CondutorStore.editCondutor');

  @override
  Future<void> editCondutor(
      {@required Condutor condutor,
      @required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    return _$editCondutorAsyncAction.run(() => super.editCondutor(
        condutor: condutor, context: context, scaffoldKey: scaffoldKey));
  }

  final _$newCondutorAsyncAction = AsyncAction('_CondutorStore.newCondutor');

  @override
  Future<void> newCondutor(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
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

  @override
  String toString() {
    return '''
loading: ${loading},
condutores: ${condutores}
    ''';
  }
}
