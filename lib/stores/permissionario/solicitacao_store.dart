import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'solicitacao_store.g.dart';

class SolicitacaoStore = _SolicitacaoStore with _$SolicitacaoStore;

abstract class _SolicitacaoStore extends MainStore with Store {
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch = "";

  @observable
  List<SolicitacaoDeAlteracao>? solicitacoes;

  @action
  Future<void> pesquisar({required String search, required BuildContext context, required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false);

      solicitacoes = (await _solicitacaoService.search(search, super.usuario!)).map((model) => SolicitacaoDeAlteracao.fromJson(model)).toList();

      if (solicitacoes == null) {
        solicitacoes = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      solicitacoes = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList({required BuildContext context, required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = '';

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacoes = (await this._solicitacaoService.search("", super.usuario!)).map((model) => SolicitacaoDeAlteracao.fromJson(model)).toList();
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }
}
