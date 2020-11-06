import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/endereco_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/screen/condutor_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/new_condutor_screen.dart';
import 'package:cityconnect/services/condutor_service.dart';
import 'package:cityconnect/services/solicitacao_alteracao_service.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'condutor_store.g.dart';

class CondutorStore = _CondutorStore with _$CondutorStore;

abstract class _CondutorStore with Store {
  @observable
  bool loading = false;

  Condutor _condutor;
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _condutorService = CondutorService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch;

  TabController tabController;

  @observable
  List<Condutor> condutores;

  bool flagAbaDadosOk = false;
  bool flagAbaEnderecoOk = false;

  @action
  Future<void> pesquisar({String search, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      condutores = (await _condutorService.search(search)).map((model) => Condutor.fromJson(model)).toList();

      if (condutores == null) {
        condutores = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      condutores = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      if (this.condutores == null) {
        this.condutores = (await this._condutorService.search("")).map((model) => Condutor.fromJson(model)).toList();
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// UPDATE CONDUTOR
  ////////////////////////////////

  @action
  Future<void> editCondutor({@required Condutor condutor, @required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this._condutor = condutor;

      dynamic returnFromScreen = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorEditScreen(this._condutor)));

      if (returnFromScreen != null && returnFromScreen) {
        SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");

        this.pesquisar(scaffoldKey: scaffoldKey, context: context, search: this._lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  ////////////////////////////////
  /////////////// NOVO CONDUTOR
  ////////////////////////////////

  @action
  Future<void> newCondutor({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.flagAbaDadosOk = false;
      this.flagAbaEnderecoOk = false;

      dynamic returnFromScreen = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewCondutorScreen()));

      if (returnFromScreen != null && returnFromScreen) {
        //SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
        CustomDialog().showMessegeDialog(
            context: context,
            barrierDismissible: true,
            imageAsset: "images/check-dialog.png",
            height: 340.0,
            text:
            "Cadastro finalizado com sucesso! Os dados foram enviados para aprovação. É possível visualizar suas solitações pendentes clicando no botão do menu Solicitações",
            voidCallback: () {});

        this.pesquisar(scaffoldKey: scaffoldKey, context: context, search: _lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> saveAbaDadosNewCondutor(
      {String nome,
      String email,
      String cpf,
      String rg,
      String ddd,
      String telefone,
      String celular,
      String cnh,
      String categoriaCNH,
      String imgComprovanteCNH,
      DateTime vencimentoCNH,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }
      print(imgComprovanteCNH);
      if (imgComprovanteCNH == null || imgComprovanteCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante da CNH não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao.campo1 = cnh;
        this.solicitacaoDeAlteracao.campo2 = categoriaCNH;
        this.solicitacaoDeAlteracao.campo3 = Util.dateFormatyyyyMMdd.format(vencimentoCNH);
        this.solicitacaoDeAlteracao.campo4 = email;
        this.solicitacaoDeAlteracao.campo5 = ddd;
        this.solicitacaoDeAlteracao.campo6 = telefone;
        this.solicitacaoDeAlteracao.campo7 = celular;
        this.solicitacaoDeAlteracao.campo15 = nome;
        this.solicitacaoDeAlteracao.campo16 = cpf;
        this.solicitacaoDeAlteracao.campo17 = rg;
        this.solicitacaoDeAlteracao.arquivo1 = imgComprovanteCNH;

        this.flagAbaDadosOk = true;

        if (!this.flagAbaEnderecoOk) {
          tabController.animateTo(1);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewCondutor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveAbaEnderecoNewCondutor(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      String imgComprovanteEndereco,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false).isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (imgComprovanteEndereco == null || imgComprovanteEndereco.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante do endereço não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao.campo8 = cep;
        this.solicitacaoDeAlteracao.campo9 = endereco;
        this.solicitacaoDeAlteracao.campo10 = numero;
        this.solicitacaoDeAlteracao.campo11 = complemento;
        this.solicitacaoDeAlteracao.campo12 = bairro;
        this.solicitacaoDeAlteracao.campo13 = municipio;
        this.solicitacaoDeAlteracao.campo14 = uf;
        this.solicitacaoDeAlteracao.arquivo2 = imgComprovanteEndereco;

        this.flagAbaEnderecoOk = true;

        if (!this.flagAbaDadosOk) {
          SnackMessages.showSnackBarWarning(context, scaffoldKey, "É necessário salvar a aba de Dados para completar o processo");
          tabController.animateTo(0);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewCondutor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  Future<void> _saveNewCondutor({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    CustomDialog().showConfirmDialog(
        context: context,
        text: "Tem certeza que\ndeseja salvar?",
        voidCallbackSim: () {
          try {
            this._solicitacaoService.createSolicitacao(this.solicitacaoDeAlteracao).then((_) => Navigator.of(context).pop(true));
          } catch (e) {
            SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser().toString().replaceAll("endereco.", ""));
          }
        },
        voidCallbackNao: () {});
  }

//  Future<void> saveCondutor(
//      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
//    if (this._condutor.id == null || this._condutor.id.toString().isEmpty) {
//      if ((await _solicitacaoService.create(this._condutor.toMap()) != null)) {
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
