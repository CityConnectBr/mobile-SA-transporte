import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'subistituicao_veiculo_store.g.dart';

class SubstituicaoVeiculoStore = _SubstituicaoVeiculoStore
    with _$SubstituicaoVeiculoStore;

abstract class _SubstituicaoVeiculoStore extends MainStore with Store {
  @observable
  bool loading = false;

  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  SolicitacaoDeAlteracao? solicitacaoDeAlteracao;

  @action
  Future<void> solicitarSubstituicaoVeiculoEscolar(
      {required String? veiculoId,
      required String? fotoVeiculo,
      required String? fotoIPVA,
      required String? fotoCRLV,
      required String? fotoLaudoTacografo,
      required String? fotoAutorizacaoCIRETRAN,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      String msgError = "";
      if (fotoVeiculo == null || fotoVeiculo.isEmpty) {
        aux = false;
        msgError = "Foto do veículo é obrigatória";
      }

      if (fotoIPVA == null || fotoIPVA.isEmpty) {
        aux = false;
        msgError = "Foto do IPVA é obrigatória";
      }

      if (fotoCRLV == null || fotoCRLV.isEmpty) {
        aux = false;
        msgError = "Foto do CRLV é obrigatória";
      }

      if (fotoLaudoTacografo == null || fotoLaudoTacografo.isEmpty) {
        aux = false;
        msgError = "Foto do laudo do tacógrafo é obrigatória";
      }

      if (fotoAutorizacaoCIRETRAN == null || fotoAutorizacaoCIRETRAN.isEmpty) {
        aux = false;
        msgError = "Foto da autorização do CIRETRAN é obrigatória";
      }

      if (!aux) {
        SnackMessages.showSnackBarError(context, scaffoldKey, msgError);
      }

      if (aux) {
        solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        solicitacaoDeAlteracao?.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.SUBSTITUICAO_VEICULO_ESCOLAR
                .toString();

        solicitacaoDeAlteracao?.referenciaId = veiculoId;
        solicitacaoDeAlteracao?.arquivo1 = fotoVeiculo;
        solicitacaoDeAlteracao?.arquivo2 = fotoIPVA;
        solicitacaoDeAlteracao?.arquivo3 = fotoCRLV;
        solicitacaoDeAlteracao?.arquivo4 = fotoLaudoTacografo;
        solicitacaoDeAlteracao?.arquivo5 = fotoAutorizacaoCIRETRAN;

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

  @action
  Future<void> solicitarSubstituicaoVeiculoTaxi(
      {required String? veiculoId,
      required String? fotoCRLV,
      required String? fotoComprovanteRetiradaTaximetroAfericao,
      required String? fotoSeloGas,
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

      if (fotoComprovanteRetiradaTaximetroAfericao == null ||
          fotoComprovanteRetiradaTaximetroAfericao.isEmpty) {
        aux = false;
        msgError =
            "Foto do comprovante de retirada do taxímetro para aferição é obrigatória";
      }

      if (fotoSeloGas == null || fotoSeloGas.isEmpty) {
        aux = false;
        msgError = "Foto do selo de gás é obrigatória";
      }

      if (!aux) {
        SnackMessages.showSnackBarError(context, scaffoldKey, msgError);
      }

      if (aux) {
        solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        solicitacaoDeAlteracao?.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.SUBSTITUICAO_VEICULO_TAXI.toString();

        solicitacaoDeAlteracao?.referenciaId = veiculoId;
        solicitacaoDeAlteracao?.arquivo1 = fotoCRLV;
        solicitacaoDeAlteracao?.arquivo2 =
            fotoComprovanteRetiradaTaximetroAfericao;
        solicitacaoDeAlteracao?.arquivo3 = fotoSeloGas;

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
