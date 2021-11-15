import 'dart:io';

import 'package:sa_transportes_mobile/models/monitor_model.dart';
import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/screen/monitor_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/monitor_foto_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/new_monitor_screen.dart';
import 'package:sa_transportes_mobile/services/monitor_service.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'monitor_store.g.dart';

class MonitorStore = _MonitorStore with _$MonitorStore;

abstract class _MonitorStore extends MainStore with Store {
  Monitor monitor;
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _monitorService = MonitorService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch;
  String fotoMonitor;

  TabController tabController;

  @observable
  List<Monitor> monitores;

  bool flagAbaDadosOk = false;
  bool flagAbaEnderecoOk = false;

  @action
  Future<void> pesquisar({String search, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false);

      monitores = (await _monitorService.search(search, super.usuario)).map((model) => Monitor.fromJson(model)).toList();

      print(monitores.length);
      if (monitores == null) {
        monitores = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      monitores = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = null;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.monitores = (await this._monitorService.search("", super.usuario)).map((model) => Monitor.fromJson(model)).toList();
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// UPDATE MONITOR
  ////////////////////////////////

  @action
  Future<void> showMonitor({@required Monitor monitor, @required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.monitor = monitor;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MonitorEditScreen(this.monitor)));

    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editFotoMonitor({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MonitorFotoScreen()));

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      solicitacaoExistente =
          (await _solicitacaoService.searchForSolicitacoes(SolicitacaoDeAlteracaoService.TIPO_MONITOR_FOTO, monitor.id.toString(), true, super.usuario))
                  .length >
              0;
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editMonitor(
      {@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey, @required int tipoDaSolicitacao, Widget screenToOpen}) async {
    try {
      print("---------------");
      this.solicitacaoDeAlteracao = null; //zerando solicitacao
      this.solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenToOpen));

      this.loading = true;

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
          (await _solicitacaoService.searchForSolicitacoes(tipoDaSolicitacao, monitor.id.toString(), true, super.usuario));

      if (solicitacoesEmAberto.isNotEmpty) {
        this.solicitacaoExistente = true;
        this.solicitacaoDeAlteracao = solicitacoesEmAberto.last;
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  /////////////////////////
  /////////////////////////

  @action
  Future<void> saveFotoMonitor({String foto, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
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
        this.solicitacaoDeAlteracao.referenciaId = monitor.id.toString();
        this.solicitacaoDeAlteracao.arquivo1 = foto;
        solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_MONITOR_FOTO.toString();

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
  Future<void> saveContatoMonitor({
    String email,
    String telefone,
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.solicitacaoDeAlteracao.referenciaId = monitor.id.toString();
      this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_MONITOR_CONTATO.toString();
      this.solicitacaoDeAlteracao.campo1 = email;
      this.solicitacaoDeAlteracao.campo3 = telefone;

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
  Future<void> saveIdentidadeMonitor({
    String nome,
    String cpf,
    String rg,
    String imgComprovante,
    DateTime dataNasc,
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
        this.solicitacaoDeAlteracao.referenciaId = monitor.id.toString();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_MONITOR_IDENTIDADE.toString();
        this.solicitacaoDeAlteracao.campo1 = nome;
        this.solicitacaoDeAlteracao.campo2 = cpf;
        this.solicitacaoDeAlteracao.campo3 = rg;
        this.solicitacaoDeAlteracao.campo4 = Util.dateFormatyyyyMMdd.format(dataNasc);
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
  Future<void> saveEnderecoMonitor({
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
        this.solicitacaoDeAlteracao.referenciaId = monitor.id.toString();
        this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_MONITOR_ENDERECO.toString();
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
  /////////////// NOVO MONITOR
  ////////////////////////////////

  @action
  Future<void> newMonitor({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_MONITOR_CADASTRO.toString();

      this.flagAbaDadosOk = false;
      this.flagAbaEnderecoOk = false;
      this.fotoMonitor = null;

      dynamic returnFromScreen = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewMonitorScreen()));

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
  Future<void> saveAbaDadosNewMonitor(
      {String nome,
      String email,
      String cpf,
      String rg,
      String telefone,
      String imgComprovante,
      DateTime dataNasc,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (imgComprovante == null || imgComprovante.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante da CNH não pode estar vazio.");
      }

      if (fotoMonitor == null || fotoMonitor.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey, "Monitor não possui foto.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao.campo1 = email;
        this.solicitacaoDeAlteracao.campo2 = telefone;
        this.solicitacaoDeAlteracao.campo10 = nome;
        this.solicitacaoDeAlteracao.campo11 = cpf;
        this.solicitacaoDeAlteracao.campo12 = rg;
        this.solicitacaoDeAlteracao.campo13 = Util.dateFormatyyyyMMdd.format(dataNasc);
        this.solicitacaoDeAlteracao.arquivo1 = imgComprovante;

        this.flagAbaDadosOk = true;

        if (!this.flagAbaEnderecoOk) {
          tabController.animateTo(1);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewMonitor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveAbaEnderecoNewMonitor(
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
        this.solicitacaoDeAlteracao.campo3 = cep;
        this.solicitacaoDeAlteracao.campo4 = endereco;
        this.solicitacaoDeAlteracao.campo5 = numero;
        this.solicitacaoDeAlteracao.campo6 = complemento;
        this.solicitacaoDeAlteracao.campo7 = bairro;
        this.solicitacaoDeAlteracao.campo8 = municipio;
        this.solicitacaoDeAlteracao.campo9 = uf;
        this.solicitacaoDeAlteracao.arquivo2 = imgComprovanteEndereco;

        this.flagAbaEnderecoOk = true;

        if (!this.flagAbaDadosOk) {
          SnackMessages.showSnackBarWarning(context, scaffoldKey, "É necessário salvar a aba de Dados para completar o processo");
          tabController.animateTo(0);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewMonitor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  Future<void> _saveNewMonitor({BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    CustomDialog().showConfirmDialog(
        context: context,
        text: "Tem certeza que\ndeseja salvar?",
        voidCallbackSim: () async {
          try {
            this.solicitacaoDeAlteracao.arquivo3 = fotoMonitor;
            await this._solicitacaoService.createSolicitacao(this.solicitacaoDeAlteracao, super.usuario).then((_) => Navigator.of(context).pop(true));
          } catch (e) {
            SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser().toString().replaceAll("endereco.", ""));
          }
        },
        voidCallbackNao: () {}
    );
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

  @action
  Future<File> loadPhotoFromMonitor(Monitor monitor) async {
    try {
      return await this._monitorService.downloadPhoto(monitor, super.usuario);
    } catch (e) {}
    return null;
  }
}
