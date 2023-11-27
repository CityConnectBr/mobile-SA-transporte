import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'solicitacao_alvara_store.g.dart';

class SolicitacaoAlvaraStore = _SolicitacaoAlvaraStore
    with _$SolicitacaoAlvaraStore;

abstract class _SolicitacaoAlvaraStore extends MainStore with Store {
  @observable
  bool loading = false;

  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  SolicitacaoDeAlteracao? solicitacaoDeAlteracao;

  @action
  Future<void> solicitarNovoAlvara(
      {required bool? possuiGNV,
      required DateTime? dataVencimentoGNV,
      required bool? ocorreuMudancaEndereco,
      required DateTime? dataVencimentoCNH,
      required DateTime? dataVencimentoDistribuicaoCriminal,
      required String? fotoCRLV,
      required String? fotoComprovanteAfericaoTaximetro,
      required String? fotoComprovanteResidencia,
      required String? fotoCNH,
      required String? fotoComprovanteLaudoVistoria,
      required String? fotoComprovanteDistribuicaoCriminal,
      required String? fotoGNV,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      String msgError = "";
      if (fotoCRLV == null || fotoCRLV.isEmpty) {
        aux = false;
        msgError = "Foto do CRLV é obrigatória";
      }

      if (fotoComprovanteAfericaoTaximetro == null ||
          fotoComprovanteAfericaoTaximetro.isEmpty) {
        aux = false;
        msgError = "Foto do comprovante de aferição do taxímetro é obrigatória";
      }

      if (ocorreuMudancaEndereco == true &&
          (fotoComprovanteResidencia == null ||
              fotoComprovanteResidencia.isEmpty)) {
        aux = false;
        msgError = "Foto do comprovante de residência é obrigatória";
      }

      if (fotoCNH == null || fotoCNH.isEmpty) {
        aux = false;
        msgError = "Foto da CNH é obrigatória";
      }

      if (fotoComprovanteLaudoVistoria == null ||
          fotoComprovanteLaudoVistoria.isEmpty) {
        aux = false;
        msgError = "Foto do comprovante de laudo de vistoria é obrigatória";
      }

      if (fotoComprovanteDistribuicaoCriminal == null ||
          fotoComprovanteDistribuicaoCriminal.isEmpty) {
        aux = false;
        msgError = "Foto do comprovante de distribuição criminal é obrigatória";
      }

      if (possuiGNV == true &&
          (fotoGNV == null || fotoGNV.isEmpty || dataVencimentoGNV == null)) {
        aux = false;
        msgError = "Foto do GNV e data de vencimento são obrigatórios";
      }

      if (!aux) {
        SnackMessages.showSnackBarError(context, scaffoldKey, msgError);
      }

      if (aux) {
        solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        solicitacaoDeAlteracao?.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.RENOVACAO_ALVARA.toString();

        solicitacaoDeAlteracao?.campo1 = possuiGNV! ? "S" : "N";
        solicitacaoDeAlteracao?.campo2 =
            Util.dateFormatyyyyMMdd.format(dataVencimentoGNV!);
        solicitacaoDeAlteracao?.campo3 = ocorreuMudancaEndereco! ? "S" : "N";
        solicitacaoDeAlteracao?.campo4 =
            Util.dateFormatyyyyMMdd.format(dataVencimentoCNH!);
        solicitacaoDeAlteracao?.campo5 =
            Util.dateFormatyyyyMMdd.format(dataVencimentoDistribuicaoCriminal!);
        solicitacaoDeAlteracao?.arquivo1 = fotoCNH;
        solicitacaoDeAlteracao?.arquivo2 = fotoCRLV;
        solicitacaoDeAlteracao?.arquivo3 = fotoComprovanteAfericaoTaximetro;
        solicitacaoDeAlteracao?.arquivo4 =
            ocorreuMudancaEndereco == true ? fotoComprovanteResidencia : null;
        solicitacaoDeAlteracao?.arquivo5 = fotoComprovanteLaudoVistoria;
        solicitacaoDeAlteracao?.arquivo6 = fotoComprovanteDistribuicaoCriminal;
        solicitacaoDeAlteracao?.arquivo7 = possuiGNV == true ? fotoGNV : null;

        CustomDialog().showConfirmDialog(
            context: context,
            text: "Tem certeza que\ndeseja salvar?",
            voidCallbackSim: () async {
              try {
                if (solicitacaoDeAlteracao == null)
                  throw Exception("Solicitação não pode ser nula");

                await _solicitacaoService
                    .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!)
                    .then((_) => Navigator.of(context).pop(true));
              } catch (e) {
                SnackMessages.showSnackBarError(context, scaffoldKey,
                    ErrorHandlerUtil(e).getMessegeToUser().toString());
              }
            },
            voidCallbackNao: () {});
      }
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }
}
