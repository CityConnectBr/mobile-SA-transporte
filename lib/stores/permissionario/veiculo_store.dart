import 'package:cityconnect/models/marca_modelo_veiculo_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/models/tipo_combustivel_model.dart';
import 'package:cityconnect/models/tipo_veiculo_model.dart';
import 'package:cityconnect/models/veiculo_model.dart';
import 'package:cityconnect/screen/permissionario/new_veiculo_screen.dart';
import 'package:cityconnect/screen/veiculo_edit_screen.dart';
import 'package:cityconnect/services/cor_veiculo_service.dart';
import 'package:cityconnect/services/marca_modelo_veiculo_service.dart';
import 'package:cityconnect/services/solicitacao_alteracao_service.dart';
import 'package:cityconnect/services/tipo_combustivel_service.dart';
import 'package:cityconnect/services/tipo_veiculo_service.dart';
import 'package:cityconnect/services/veiculo_service.dart';
import 'package:cityconnect/stores/main_store.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/widgets/custom_autocomplete.dart';
import 'package:cityconnect/widgets/snack_message.dart';
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

  String _lastSearch;

  @observable
  List<Veiculo> veiculos;

  @action
  Future<void> pesquisar({String search, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      veiculos = (await _veiculoService.search(search, super.usuario)).map((model) => Veiculo.fromJson(model)).toList();

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

      this.veiculos = (await this._veiculoService.search("", super.usuario)).map((model) => Veiculo.fromJson(model)).toList();
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

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoEditScreen(this.veiculo)));
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editVeiculo({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey, Widget screenToOpen}) async {
    try {
      print("---------------");
      this.solicitacaoDeAlteracao = null; //zerando solicitacao
      this.solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenToOpen));

      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
          (await _solicitacaoService.searchForSolicitacoes(SolicitacaoDeAlteracaoService.TIPO_VEICULO, veiculo.id.toString(), true, super.usuario));

      if (solicitacoesEmAberto.isNotEmpty) {
        this.solicitacaoExistente = true;
        this.solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  ////////////////////////////////
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



  ////////////////////////////////
  ////////////////////////////////

  Future<List<Suggestion>> searchMarcaModelo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _marcaModeloVeiculoService.search(search, super.usuario)).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Suggestion>> searchTipoCombustivel(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _tipoCombustivelService.search(search, super.usuario)).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Suggestion>> searchTipoVeiculo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _tipoVeiculoService.search(search, super.usuario)).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Suggestion>> searchCorVeiculo(String search) async {
    List<Suggestion> suggestionList = List();
    try {
      (await _corVeiculoService.search(search, super.usuario)).forEach((element) {
        suggestionList.add(Suggestion(element["id"].toString(), element["descricao"]));
      });

      return suggestionList;
    } catch (e) {
      print(e);
    }
  }

//
//  @action
//  Future<void> editCondutor(
//      {@required Condutor condutor,
//      @required BuildContext context,
//      @required GlobalKey<ScaffoldState> scaffoldKey}) async {
//    try {
//      assert(await Provider.of<UsuarioStore>(context, listen: false)
//          .isLoggedInWithRedirect(
//              context: context, redirectToHomeIfLogged: false));
//
//      this._condutor = condutor;
//
//      dynamic returnFromScreen = await Navigator.of(context).push(
//          MaterialPageRoute(
//              builder: (context) => CondutorScreen(this._condutor)));
//
//      if (returnFromScreen != null && returnFromScreen) {
//        SnackMessages.showSnackBarSuccess(
//            context, scaffoldKey, "Salvo com sucesso");
//
//        this.pesquisarCondutores(
//            scaffoldKey: scaffoldKey,
//            context: context,
//            search: this._lastSearch);
//      }
//    } catch (e) {
//      SnackMessages.showSnackBarError(
//          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
//    }
//  }
//
//  @action
//  Future<void> save(
//      {String nome,
//      String email,
//      String cpf,
//      String rg,
//      String naturalidade,
//      String nacionalidade,
//      DateTime dataNascimento,
//      String ddd,
//      String telefone,
//      String celular,
//      String cnh,
//      String categoriaCNH,
//      DateTime vencimentoCNH,
//      BuildContext context,
//      GlobalKey<ScaffoldState> scaffoldKey}) async {
//    loading = true;
//
//    try {
//      assert(await Provider.of<UsuarioStore>(context, listen: false)
//          .isLoggedInWithRedirect(
//              context: context, redirectToHomeIfLogged: false));
//
//      bool aux = true;
//      if (categoriaCNH == null || categoriaCNH.isEmpty) {
//        aux = false;
//        SnackMessages.showSnackBarError(
//            context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
//      }
//
//      if (this._condutor.endereco == null ||
//          this._condutor.endereco.cep == null) {
//        SnackMessages.showSnackBarError(
//            context, scaffoldKey, "Aba endereços esta vazia ou não esta salva");
//      }
//
//      if (aux) {
//        this._condutor.nome = nome;
//        this._condutor.email = email;
//        this._condutor.rg = rg;
//        this._condutor.cpf = cpf;
//        this._condutor.naturalidade = naturalidade;
//        this._condutor.nacionalidade = nacionalidade;
//        this._condutor.dataNascimento = dataNascimento;
//        this._condutor.ddd = ddd;
//        this._condutor.telefone = telefone;
//        this._condutor.celular = celular;
//        this._condutor.cnh = cnh;
//        this._condutor.categoriaCNH = categoriaCNH;
//        this._condutor.vencimentoCNH = vencimentoCNH;
//
//        await saveCondutor(context: context, scaffoldKey: scaffoldKey);
//      }
//    } catch (e) {
//      SnackMessages.showSnackBarError(
//          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
//    }
//
//    loading = false;
//  }
//
//  @action
//  Future<void> saveEndereco(
//      {String cep,
//      String endereco,
//      String numero,
//      String complemento,
//      String bairro,
//      String municipio,
//      String uf,
//      BuildContext context,
//      GlobalKey<ScaffoldState> scaffoldKey}) async {
//    loading = true;
//
//    try {
//      assert(await Provider.of<UsuarioStore>(context, listen: false)
//          .isLoggedInWithRedirect(
//              context: context, redirectToHomeIfLogged: false));
//
//      if (this._condutor.endereco == null) {
//        this._condutor.endereco = Endereco();
//      }
//
//      this._condutor.endereco.cep = cep;
//      this._condutor.endereco.endereco = endereco;
//      this._condutor.endereco.numero = numero;
//      this._condutor.endereco.complemento = complemento;
//      this._condutor.endereco.bairro = bairro;
//      this._condutor.endereco.municipio = municipio;
//      this._condutor.endereco.uf = uf;
//
//      await saveCondutor(context: context, scaffoldKey: scaffoldKey);
//    } catch (e) {
//      SnackMessages.showSnackBarError(
//          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
//    }
//
//    loading = false;
//  }
//
//  Future<void> saveCondutor(
//      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
//    if (this._condutor.id == null || this._condutor.id.toString().isEmpty) {
//      if ((await _condutorService.create(this._condutor.toMap()) != null)) {
//        Navigator.of(context).pop(true);
//      }
//    } else {
//      if (await _condutorService.update(
//          this._condutor.id.toString(), this._condutor.toMap())) {
//        Navigator.of(context).pop(true);
//      }
//    }
//  }
}
