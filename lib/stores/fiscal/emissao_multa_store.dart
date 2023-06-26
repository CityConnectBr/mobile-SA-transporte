import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'emissao_multa_store.g.dart';

class EmissaoMultaStore = _EmissaoMultaStore with _$EmissaoMultaStore;

abstract class _EmissaoMultaStore extends MainStore with Store {
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  @action
  Future<void> criarSolicitacaoDeInfracao(
      {DateTime data,
      String hora,
      String descricao,
      String foto,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (foto == null || foto.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "É necessário enviar uma foto.");
      }

      if (aux) {
        solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.SOLICITACAO_INFRACAO.toString();
        solicitacaoDeAlteracao.campo1 = Util.dateFormatyyyyMMdd.format(data);
        solicitacaoDeAlteracao.campo2 = hora;
        solicitacaoDeAlteracao.campo3 = descricao;
        solicitacaoDeAlteracao.arquivo1 = foto;


        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, "Solicitação enviada com sucesso.");

        await _solicitacaoService
            .createSolicitacao(solicitacaoDeAlteracao, super.usuario)
            .then((_) => Navigator.of(context).pop(true));
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }
}
