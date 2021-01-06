import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/screen/condutor_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/condutor_dados_contato_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/condutor_dados_endereco_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/condutor_foto_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/new_condutor_screen.dart';
import 'package:cityconnect/services/condutor_service.dart';
import 'package:cityconnect/services/solicitacao_alteracao_service.dart';
import 'package:cityconnect/stores/main_store.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'solicitacao_store.g.dart';

class SolicitacaoStore = _SolicitacaoStore with _$SolicitacaoStore;

abstract class _SolicitacaoStore extends MainStore with Store {
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch;

  @observable
  List<SolicitacaoDeAlteracao> solicitacoes;

  @action
  Future<void> pesquisar({String search, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false);

      solicitacoes = (await _solicitacaoService.search(search, super.usuario)).map((model) => SolicitacaoDeAlteracao.fromJson(model)).toList();
print("akiiiii");
print(solicitacoes.length);
      print(solicitacoes.length);
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
  Future<void> firstLoadList({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      if (this.solicitacoes == null) {
        this.solicitacoes = (await this._solicitacaoService.search("", super.usuario)).map((model) => SolicitacaoDeAlteracao.fromJson(model)).toList();
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }
}
