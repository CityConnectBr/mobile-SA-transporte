import 'package:sa_transportes_mobile/models/cor_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/marca_modelo_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/models/tipo_combustivel_model.dart';
import 'package:sa_transportes_mobile/models/tipo_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/new_veiculo_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/substituicao_veiculo_escolar_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/substituicao_veiculo_taxi_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_edit_screen.dart';
import 'package:sa_transportes_mobile/services/cor_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/marca_modelo_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/services/tipo_combustivel_service.dart';
import 'package:sa_transportes_mobile/services/tipo_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/veiculo_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/widgets/custom_autocomplete.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as dev;

part 'veiculo_store.g.dart';

class VeiculoStore = _VeiculoStore with _$VeiculoStore;

abstract class _VeiculoStore extends MainStore with Store {
  @observable
  bool loading = false;

  Veiculo? veiculo;
  SolicitacaoDeAlteracao? solicitacaoDeAlteracao;

  final _veiculoService = VeiculoService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();
  final _marcaModeloVeiculoService = MarcaModeloVeiculoService();
  final _tipoCombustivelService = TipoCombustivelService();
  final _corVeiculoService = CorVeiculoService();
  final _tipoVeiculoService = TipoVeiculoService();

  String _lastSearch = "";

  @observable
  List<Veiculo>? veiculos;

  @action
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      _lastSearch = search;

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      veiculos = (await _veiculoService.search(search, super.usuario!))
          .map((model) => Veiculo.fromJson(model))
          .toList();

      if (veiculos == null) {
        veiculos = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      veiculos = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      _lastSearch = '';

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));
      //dev.debugger();
      veiculos = (await _veiculoService.search("", super.usuario!))
          .map((model) => Veiculo.fromJson(model))
          .toList();
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// UPDATE VEICULO
  ////////////////////////////////

  @action
  Future<void> showVeiculo(
      {required Veiculo veiculo,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      loading = true;

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.veiculo = veiculo;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VeiculoEditScreen(this.veiculo!)));
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    loading = false;
  }

  @action
  Future<void> editVeiculo(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Widget screenToOpen}) async {
    try {
      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screenToOpen));

      loading = true;

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
          (await _solicitacaoService.searchForSolicitacoes(
              SolicitacaoDeAlteracaoService.TIPO_VEICULO,
              veiculo!.id.toString(),
              true,
              super.usuario!));

      if (solicitacoesEmAberto.isNotEmpty) {
        solicitacaoExistente = true;
        solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    loading = false;
  }

  ////////////////////////////////
  /////////////// NOVO VEICULO
  ////////////////////////////////

  @action
  Future<void> newVeiculo(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      veiculo = Veiculo();

      dynamic returnFromScreen = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewVeiculoScreen()));

      if (returnFromScreen != null && returnFromScreen) {
        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, "Salvo com sucesso");

        pesquisar(
            scaffoldKey: scaffoldKey, context: context, search: _lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> saveVeiculo(
      {required String placa,
      required String renavam,
      required String chassi,
      required int anoDeFabricacao,
      required int anoDoModelo,
      required String capacidade,
      required String tipoDaCapacidade,
      required String observacaoDaCapacidade,
      required int anosDeVidaUtilDoVeiculo,
      required int? marcaModeloVeiculoId,
      required int? tipoCombustivelId,
      required int? corId,
      required int? tipoVeiculoId,
      required String? documentoFoto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      String msgError = "";
      if (documentoFoto == null || documentoFoto.isEmpty) {
        aux = false;
        msgError = "Documento não pode estar vazio.";
      }

      if (marcaModeloVeiculoId == null) {
        aux = false;
        msgError += "\\nO campo Marca\\Modelo não pode estar vazio.";
      }

      if (tipoCombustivelId == null) {
        aux = false;
        msgError += "\\nO campo Tipo do Combustível não pode estar vazio.";
      }

      if (corId == null) {
        aux = false;
        msgError += "\\nO campo Cor não pode estar vazio.";
      }

      if (tipoVeiculoId == null) {
        aux = false;
        msgError += "\\nO campo Tipo do Veículo não pode estar vazio.";
      }

      if (!aux) {
        SnackMessages.showSnackBarError(context, scaffoldKey, msgError);
      }

      if (aux) {
        solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        solicitacaoDeAlteracao?.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.TIPO_VEICULO.toString();

        if (veiculo != null && veiculo?.id != null) {
          solicitacaoDeAlteracao?.referenciaId = veiculo?.id.toString();
        }

        solicitacaoDeAlteracao?.campo1 = placa;
        solicitacaoDeAlteracao?.campo2 = renavam;
        solicitacaoDeAlteracao?.campo3 = marcaModeloVeiculoId.toString();
        solicitacaoDeAlteracao?.campo4 = chassi;
        solicitacaoDeAlteracao?.campo5 = tipoCombustivelId.toString();
        solicitacaoDeAlteracao?.campo6 = anoDeFabricacao.toString();
        solicitacaoDeAlteracao?.campo7 = anoDoModelo.toString();
        solicitacaoDeAlteracao?.campo8 = corId.toString();
        solicitacaoDeAlteracao?.campo9 = tipoVeiculoId.toString();
        solicitacaoDeAlteracao?.campo10 = capacidade;
        solicitacaoDeAlteracao?.campo11 = tipoDaCapacidade[0];
        solicitacaoDeAlteracao?.campo12 = observacaoDaCapacidade;
        solicitacaoDeAlteracao?.campo13 = anosDeVidaUtilDoVeiculo.toString();
        solicitacaoDeAlteracao?.arquivo1 = documentoFoto;

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

  ////////////////////////////////
  ////////////////////////////////

  @action
  Future<void> solicitarSubstituicao(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      //check permissionario
      if (super.usuario?.permissionario == null) {
        throw Exception("Usuário não é permissionário");
      }

      if(super.usuario?.permissionario?.modalidade == 1 || super.usuario?.permissionario?.modalidade == 2){
        await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SubstituicaoVeiculoEscolarScreen(veiculoId: this.veiculo!.id!)));
      }else{
        await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SubstituicaoVeiculoTaxiScreen(veiculoId: this.veiculo!.id!)));
      }

    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  ////////////////////////////////
  ////////////////////////////////

  Future<List<Suggestion>?> searchMarcaModelo(String? search) async {
    List<Suggestion> suggestionList = [];
    try {
      (await _marcaModeloVeiculoService.search(search ?? "", super.usuario!))
          .forEach((element) {
        suggestionList
            .add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
    loading = false;
  }

  @action
  Future<MarcaModeloVeiculo?> findMarcaModeloById(String id) async {
    loading = true;
    try {
      return MarcaModeloVeiculo.fromJson(
          await _marcaModeloVeiculoService.get(int.parse(id), usuario!));
    } catch (e) {}
    loading = false;
  }

  Future<List<Suggestion>?> searchTipoCombustivel(String search) async {
    List<Suggestion> suggestionList = [];
    try {
      (await _tipoCombustivelService.search(search, super.usuario!))
          .forEach((element) {
        suggestionList
            .add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<TipoCombustivel?> findTipoCombustivelById(String id) async {
    loading = true;
    try {
      return TipoCombustivel.fromJson(
          await _tipoCombustivelService.get(int.parse(id), usuario!));
    } catch (e) {}
    loading = false;
  }

  Future<List<Suggestion>?> searchTipoVeiculo(String search) async {
    List<Suggestion> suggestionList = [];
    try {
      (await _tipoVeiculoService.search(search, super.usuario!))
          .forEach((element) {
        suggestionList
            .add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<TipoVeiculo?> findTipoVeiculoById(String id) async {
    loading = true;
    try {
      return TipoVeiculo.fromJson(
          await _tipoVeiculoService.get(int.parse(id), usuario!));
    } catch (e) {}
    loading = false;
  }

  Future<List<Suggestion>?> searchCorVeiculo(String search) async {
    List<Suggestion> suggestionList = [];
    try {
      (await _corVeiculoService.search(search, super.usuario!))
          .forEach((element) {
        suggestionList
            .add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<CorVeiculo?> findCorVeiculoById(String id) async {
    loading = true;
    try {
      return CorVeiculo.fromJson(
          await _corVeiculoService.get(int.parse(id), usuario!));
    } catch (e) {}
    loading = false;
  }
}
