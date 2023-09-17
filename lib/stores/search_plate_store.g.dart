// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_plate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPlateStore on _SearchPlateStore, Store {
  late final _$placaValidaAtom =
      Atom(name: '_SearchPlateStore.placaValida', context: context);

  @override
  bool? get placaValida {
    _$placaValidaAtom.reportRead();
    return super.placaValida;
  }

  @override
  set placaValida(bool? value) {
    _$placaValidaAtom.reportWrite(value, super.placaValida, () {
      super.placaValida = value;
    });
  }

  late final _$searchPlateAsyncAction =
      AsyncAction('_SearchPlateStore.searchPlate', context: context);

  @override
  Future<void> searchPlate() {
    return _$searchPlateAsyncAction.run(() => super.searchPlate());
  }

  @override
  String toString() {
    return '''
placaValida: ${placaValida}
    ''';
  }
}
