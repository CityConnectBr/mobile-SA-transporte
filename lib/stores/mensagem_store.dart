import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/preferences.dart';

part 'mensagem_store.g.dart';

class MensagemStore = _MensagemStore with _$MensagemStore;

abstract class _MensagemStore extends MainStore with Store {
  @observable
  List<dynamic> list = [];

  @action
  void loadMensagens() {
    list = [];
    Preferences().getList("push").then((value) {
      list = value.map((e) => jsonDecode(e)).toList();
    });
  }

  @action
  void clearMensagens() {
    list = [];
    Preferences().remove("push");
  }
}
