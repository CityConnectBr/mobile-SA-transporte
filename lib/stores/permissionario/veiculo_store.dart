
import 'package:sa_transportes_mobile/models/cor_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/marca_modelo_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/models/tipo_combustivel_model.dart';
import 'package:sa_transportes_mobile/models/tipo_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/fiscal/veiculo_perm_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/new_veiculo_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_edit_screen.dart';
import 'package:sa_transportes_mobile/services/cor_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/marca_modelo_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/services/tipo_combustivel_service.dart';
import 'package:sa_transportes_mobile/services/tipo_veiculo_service.dart';
import 'package:sa_transportes_mobile/services/usuario_service.dart';
import 'package:sa_transportes_mobile/services/veiculo_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/widgets/custom_autocomplete.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'veiculo_store.g.dart';

class VeiculoStore = _VeiculoStore with _$VeiculoStore;

abstract class _VeiculoStore extends MainStore with Store {
  @observable
  bool loading = false;

  Veiculo veiculo;
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _veiculoService = VeiculoService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();
  final _marcaModeloVeiculoService = MarcaModeloVeiculoService();
  final _tipoCombustivelService = TipoCombustivelService();
  final _corVeiculoService = CorVeiculoService();
  final _tipoVeiculoService = TipoVeiculoService();
  final _usuarioService = UsuarioService();

  String _lastSearch;

  @observable
  List<Veiculo> veiculos;

  @action
  Future<void> pesquisar({String search, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      veiculos = (await _veiculoService.search(search, await _usuarioService.getUser())).map((model) => Veiculo.fromJson(model)).toList();

      if (veiculos == null) {
        veiculos = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      veiculos = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = null;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.veiculos = (await this._veiculoService.search("", await _usuarioService.getUser())).map((model) => Veiculo.fromJson(model)).toList();
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// UPDATE VEICULO
  ////////////////////////////////

  @action
  Future<void> showVeiculo({@required Veiculo veiculo, @required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.veiculo = veiculo;

      final usuario = await _usuarioService.getUser();
      int mode = 0;
      if(usuario.permissionario!=null){
        mode = 1;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoEditScreen(this.veiculo, mode)));
      }else if(usuario.fiscal!=null){
        mode = 2;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoPermEditScreen(this.veiculo)));
      }
      else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoEditScreen(this.veiculo, mode)));
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editVeiculo({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey, Widget screenToOpen}) async {
    try {
      //print("---------------");
      this.solicitacaoDeAlteracao = null; //zerando solicitacao
      this.solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenToOpen));

      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
          (await _solicitacaoService.searchForSolicitacoes(SolicitacaoDeAlteracaoService.TIPO_VEICULO, veiculo.id.toString(), true, await _usuarioService.getUser()));

      if (solicitacoesEmAberto.isNotEmpty) {
        this.solicitacaoExistente = true;
        this.solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      }

    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> solicitarMulta(
      {@required BuildContext context,
        @required GlobalKey<ScaffoldState> scaffoldKey,
        @required int tipoDaSolicitacao,
        Widget screenToOpen}) async {
    try {
      this.loading = true;

      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screenToOpen));

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
      (await _solicitacaoService.searchForSolicitacoes(
          tipoDaSolicitacao, veiculo.id.toString(), true, await _usuarioService.getUser()));

      if (solicitacoesEmAberto.isNotEmpty) {
        this.solicitacaoExistente = true;
        this.solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> saveSolicitacaoMulta({
    String nome,
    String renavam,
    String placa,
    String descricao,
    String veiculo_nome,
    String data,
    String hora,
    String veiculo_id,
    Veiculo veiculo,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.solicitacaoDeAlteracao.referenciaId = veiculo.id.toString();
      this.solicitacaoDeAlteracao.tipoSolicitacaoId =
          SolicitacaoDeAlteracaoService.TIPO_FISCAL_MULTA.toString();
      this.solicitacaoDeAlteracao.campo1 = data;
      this.solicitacaoDeAlteracao.campo2 = hora;
      this.solicitacaoDeAlteracao.campo3 = descricao;
      this.solicitacaoDeAlteracao.campo4 = veiculo_id;

      print("ref id: ${this.solicitacaoDeAlteracao.referenciaId}");
      print("tipo solic: ${this.solicitacaoDeAlteracao.tipoSolicitacaoId}");
      print("campo1 date: ${this.solicitacaoDeAlteracao.campo1}");
      print("campo2 hora: ${this.solicitacaoDeAlteracao.campo2}");
      print("campo3 desc: ${this.solicitacaoDeAlteracao.campo3}");
      print("campo4 veic id: ${this.solicitacaoDeAlteracao.campo4}");

      await Future.value(this
          ._solicitacaoService
          .createSolicitacao(solicitacaoDeAlteracao, await _usuarioService.getUser())).timeout(const Duration(seconds:5));
      print('solicitacao criada');
      this.showDialogMessageAfterCreateSolicitacao(
          "Dados salvos com suscesso!", context, () {
        Navigator.of(context).pop(veiculo);
      });
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
  Future<void> newVeiculo({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.veiculo = Veiculo();

      dynamic returnFromScreen = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewVeiculoScreen()));

      if (returnFromScreen != null && returnFromScreen) {
        SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");

        this.pesquisar(scaffoldKey: scaffoldKey, context: context, search: _lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> saveVeiculo(
      {
        String placa,
        String renavam,
        String chassi,
        int anoDeFabricacao,
        int anoDoModelo,
        String capacidade,
        String tipoDaCapacidade,
        String observacaoDaCapacidade,
        int anosDeVidaUtilDoVeiculo,
        int marcaModeloVeiculoId,
        int tipoCombustivelId,
        int corId,
        int tipoVeiculoId,
        String documentoFoto,
        BuildContext context,
        GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      String msgError;
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


      if(!aux){
        SnackMessages.showSnackBarError(context, scaffoldKey, msgError);
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_VEICULO.toString();

        if(veiculo!=null && veiculo.id!=null) {
          this.solicitacaoDeAlteracao.referenciaId = veiculo.id.toString();
        }

        this.solicitacaoDeAlteracao.campo1 = placa;
        this.solicitacaoDeAlteracao.campo2 = renavam;
        this.solicitacaoDeAlteracao.campo3 = marcaModeloVeiculoId.toString();
        this.solicitacaoDeAlteracao.campo4 = chassi;
        this.solicitacaoDeAlteracao.campo5 = tipoCombustivelId.toString();
        this.solicitacaoDeAlteracao.campo6 = anoDeFabricacao.toString();
        this.solicitacaoDeAlteracao.campo7 = anoDoModelo.toString();
        this.solicitacaoDeAlteracao.campo8 = corId.toString();
        this.solicitacaoDeAlteracao.campo9 = tipoVeiculoId.toString();
        this.solicitacaoDeAlteracao.campo10 = capacidade;
        this.solicitacaoDeAlteracao.campo11 = tipoDaCapacidade[0];
        this.solicitacaoDeAlteracao.campo12 = observacaoDaCapacidade;
        this.solicitacaoDeAlteracao.campo13 = anosDeVidaUtilDoVeiculo.toString();
        this.solicitacaoDeAlteracao.arquivo1 = documentoFoto;

        CustomDialog().showConfirmDialog(
            context: context,
            text: "Tem certeza que\ndeseja salvar?",
            voidCallbackSim: () async {
              try {
                await this._solicitacaoService.createSolicitacao(this.solicitacaoDeAlteracao, await _usuarioService.getUser()).then((_) => Navigator.of(context).pop(true));
              } catch (e) {
                SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser().toString());
              }
            },
            voidCallbackNao: () {}
        );
      }
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  ////////////////////////////////

  Future<List<Suggestion>> searchMarcaModelo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _marcaModeloVeiculoService.search(search, await _usuarioService.getUser())).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
    loading = false;

  }

  @action
  Future<MarcaModeloVeiculo> findMarcaModeloById(String id) async {
    loading = true;
    try {
      return MarcaModeloVeiculo.fromJson(await _marcaModeloVeiculoService.get(int.parse(id), await _usuarioService.getUser()));
    } catch (e) {
    }
    loading = false;
  }

  Future<List<Suggestion>> searchTipoCombustivel(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _tipoCombustivelService.search(search, await _usuarioService.getUser())).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<TipoCombustivel> findTipoCombustivelById(String id) async {
    loading = true;
    try {
      return TipoCombustivel.fromJson(await _tipoCombustivelService.get(int.parse(id), await _usuarioService.getUser()));
    } catch (e) {
    }
    loading = false;
  }

  Future<List<Suggestion>> searchTipoVeiculo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _tipoVeiculoService.search(search, await _usuarioService.getUser())).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<TipoVeiculo> findTipoVeiculoById(String id) async {
    loading = true;
    try {
      return TipoVeiculo.fromJson(await _tipoVeiculoService.get(int.parse(id), await _usuarioService.getUser()));
    } catch (e) {
    }
    loading = false;
  }

  Future<List<Suggestion>> searchCorVeiculo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _corVeiculoService.search(search, await _usuarioService.getUser())).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<CorVeiculo> findCorVeiculoById(String id) async {
    loading = true;
    try {
      return CorVeiculo.fromJson(await _corVeiculoService.get(int.parse(id), await _usuarioService.getUser()));
    } catch (e) {
    }
    loading = false;
  }

}
