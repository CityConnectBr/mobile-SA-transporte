// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_ponto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPontoStore on _SearchPontoStore, Store {
  late final _$pontosAtom =
      Atom(name: '_SearchPontoStore.pontos', context: context);

  @override
  List<Ponto>? get pontos {
    _$pontosAtom.reportRead();
    return super.pontos;
  }

  @override
  set pontos(List<Ponto>? value) {
    _$pontosAtom.reportWrite(value, super.pontos, () {
      super.pontos = value;
    });
  }

  late final _$firstSearchAtom =
      Atom(name: '_SearchPontoStore.firstSearch', context: context);

  @override
  bool get firstSearch {
    _$firstSearchAtom.reportRead();
    return super.firstSearch;
  }

  @override
  set firstSearch(bool value) {
    _$firstSearchAtom.reportWrite(value, super.firstSearch, () {
      super.firstSearch = value;
    });
  }

  late final _$searchPontoEscolarAsyncAction =
      AsyncAction('_SearchPontoStore.searchPontoEscolar', context: context);

  @override
  Future<void> searchPontoEscolar() {
    return _$searchPontoEscolarAsyncAction
        .run(() => super.searchPontoEscolar());
  }

  @override
  String toString() {
    return '''
pontos: ${pontos},
firstSearch: ${firstSearch}
    ''';
  }
}
