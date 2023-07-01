import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sa_transportes_mobile/services/veiculo_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';

part 'search_plate_store.g.dart';

class SearchPlateStore = _SearchPlateStore with _$SearchPlateStore;

abstract class _SearchPlateStore extends MainStore with Store {
  final _veiculoService = VeiculoService();

  TextEditingController placaController = TextEditingController();

  @observable
  bool? placaValida;

  @action
  Future<void> searchPlate() async {
    if (placaController.text.isEmpty) {
      placaValida = null;
      return;
    }
    
    placaValida = await _veiculoService
        .checkPlaca(placaController.text.replaceAll("-", "").trim());
  }
}
