import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sa_transportes_mobile/models/ponto_model.dart';
import 'package:sa_transportes_mobile/services/ponto_permissionario_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';

part 'search_ponto_store.g.dart';

class SearchPontoStore = _SearchPontoStore with _$SearchPontoStore;

abstract class _SearchPontoStore extends MainStore with Store {
  final _service = PontoDoPermissionarioService();

  TextEditingController searchController = TextEditingController();

  @observable
  List<Ponto>? pontos;

  @observable
  bool firstSearch = false;

  @action
  Future<void> searchPontoEscolar() async {
    firstSearch = true;
    pontos = (await _service.searchPontoEscolar(this.searchController.text, super.usuario!))
        .map((model) => Ponto.fromJsonPontoPermissionario(model))
        .toList();
  }
}
