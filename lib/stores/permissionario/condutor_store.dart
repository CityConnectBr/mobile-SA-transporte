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

part 'condutor_store.g.dart';

class CondutorStore = _CondutorStore with _$CondutorStore;

abstract class _CondutorStore extends MainStore with Store {
  Condutor condutor;
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _condutorService = CondutorService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch;
  String fotoCondutor;

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

      await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false);

      condutores = (await _condutorService.search(search, super.usuario)).map((model) => Condutor.fromJson(model)).toList();

      print(condutores.length);
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
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      if (this.condutores == null) {
        this.condutores = (await this._condutorService.search("", super.usuario)).map((model) => Condutor.fromJson(model)).toList();
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
  Future<void> showCondutor({@required Condutor condutor, @required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.condutor = condutor;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorEditScreen(this.condutor))).then((returnFromScreen) => () {
            if (returnFromScreen != null && returnFromScreen) {
              SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");

              this.pesquisar(scaffoldKey: scaffoldKey, context: context, search: this._lastSearch);
            }
          });
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editFotoCondutor({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorFotoScreen()));

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      solicitacaoExistente =
          (await _solicitacaoService.searchForSolicitacoes(SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_FOTO, condutor.id.toString(), true, super.usuario)).length > 0;
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editCondutor(
      {@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey, @required int tipoDaSolicitacao, Widget screenToOpen}) async {
    try {
      this.loading = true;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenToOpen));

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto = (await _solicitacaoService.searchForSolicitacoes(tipoDaSolicitacao, condutor.id.toString(), true, super.usuario));

      if (solicitacoesEmAberto.isNotEmpty) {
        this.solicitacaoExistente = true;
        this.solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      } else {
        this.solicitacaoExistente = false;
        this.solicitacaoDeAlteracao = null;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  /////////////////////////
  /////////////////////////

  @action
  Future<void> saveFotoCondutor({String foto, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (foto == null || foto.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Nenhuma foto selecionada.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
        this.solicitacaoDeAlteracao.arquivo1 = foto;
        solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_FOTO.toString();

        await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);

        this.showDialogMessageAfterCreateSolicitacao("Foto salva com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveContatoCondutor({
    String email,
    String ddd,
    String telefone,
    String celular,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
      this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CONTATO.toString();
      this.solicitacaoDeAlteracao.campo1 = email;
      this.solicitacaoDeAlteracao.campo2 = ddd;
      this.solicitacaoDeAlteracao.campo3 = telefone;
      this.solicitacaoDeAlteracao.campo4 = celular;

      await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);

      this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
        Navigator.of(context).pop();
      });
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveIdentidadeCondutor({
    String nome,
    String cpf,
    String rg,
    String imgComprovante,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovante == null || imgComprovante.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_IDENTIDADE.toString();
        this.solicitacaoDeAlteracao.campo1 = nome;
        this.solicitacaoDeAlteracao.campo2 = cpf;
        this.solicitacaoDeAlteracao.campo3 = rg;
        this.solicitacaoDeAlteracao.arquivo1 = imgComprovante;

        await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);

        this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveCNHCondutor({
    String cnh,
    String categoria,
    DateTime validade,
    String imgComprovante,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovante == null || imgComprovante.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CNH.toString();
        this.solicitacaoDeAlteracao.campo1 = cnh;
        this.solicitacaoDeAlteracao.campo2 = categoria;
        this.solicitacaoDeAlteracao.campo3 = Util.dateFormatyyyyMMdd.format(validade);
        this.solicitacaoDeAlteracao.arquivo1 = imgComprovante;

        await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);

        this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveEnderecoCondutor({
    String cep,
    String endereco,
    String numero,
    String complemento,
    String bairro,
    String municipio,
    String uf,
    String imgComprovanteEndereco,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovanteEndereco == null || imgComprovanteEndereco.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante do endereço não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_ENDERECO.toString();
        this.solicitacaoDeAlteracao.campo1 = cep;
        this.solicitacaoDeAlteracao.campo2 = endereco;
        this.solicitacaoDeAlteracao.campo3 = numero;
        this.solicitacaoDeAlteracao.campo4 = complemento;
        this.solicitacaoDeAlteracao.campo5 = bairro;
        this.solicitacaoDeAlteracao.campo6 = municipio;
        this.solicitacaoDeAlteracao.campo7 = uf;
        this.solicitacaoDeAlteracao.arquivo1 = imgComprovanteEndereco;

        await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);

        this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// NOVO CONDUTOR
  ////////////////////////////////

  @action
  Future<void> newCondutor({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      solicitacaoDeAlteracao.tipoSolicitacaoId = "5"; //condutor_cadastro

      this.flagAbaDadosOk = false;
      this.flagAbaEnderecoOk = false;
      this.fotoCondutor = null;

      dynamic returnFromScreen = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewCondutorScreen()));

      if (returnFromScreen != null && returnFromScreen) {
        //SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
        this.showDialogMessageAfterCreateSolicitacao("Cadastro finalizado com sucesso! ", context, () {});

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
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }

      if (imgComprovanteCNH == null || imgComprovanteCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante da CNH não pode estar vazio.");
      }

      if (fotoCondutor == null || fotoCondutor.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Condutor não possui foto.");
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
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

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
        voidCallbackSim: () async {
          try {
            this.solicitacaoDeAlteracao.arquivo3 = fotoCondutor;
            await this._solicitacaoService.createSolicitacao(this.solicitacaoDeAlteracao, super.usuario).then((_) => Navigator.of(context).pop(true));
          } catch (e) {
            SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser().toString().replaceAll("endereco.", ""));
          }
        },
        voidCallbackNao: () {});
  }

  void showDialogMessageAfterCreateSolicitacao(String startOfMessage, BuildContext context, VoidCallback voidCallback) {
    CustomDialog().showMessegeDialog(
        context: context,
        barrierDismissible: true,
        imageAsset: "images/check-dialog.png",
        height: 340.0,
        text:
            startOfMessage + " Os dados foram enviados para aprovação. É possível visualizar suas solitações pendentes clicando no botão do menu Solicitações",
        voidCallback: voidCallback);
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
