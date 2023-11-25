import 'dart:io';

import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/screen/condutor_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/condutor_foto_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/new_condutor_screen.dart';
import 'package:sa_transportes_mobile/services/condutor_service.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as dev;

part 'condutor_store.g.dart';

class CondutorStore = _CondutorStore with _$CondutorStore;

abstract class _CondutorStore extends MainStore with Store {
  Condutor? condutor;
  SolicitacaoDeAlteracao? solicitacaoDeAlteracao;

  final _condutorService = CondutorService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String _lastSearch = "";
  String fotoCondutor = "";

  @observable
  File? fotoCondutorFile;

  TabController? tabController;

  @observable
  List<Condutor>? condutores;

  bool flagAbaDadosOk = false;
  bool flagAbaEnderecoOk = false;

  @action
  Future<void> pesquisar(
      {required String search,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false);

      condutores = (await _condutorService.search(search, super.usuario!))
          .map((model) => Condutor.fromJson(model))
          .toList();

      if (condutores == null) {
        condutores = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      condutores = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = '';

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.condutores = (await this._condutorService.search("", super.usuario!))
          .map((model) => Condutor.fromJson(model))
          .toList();
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// UPDATE CONDUTOR
  ////////////////////////////////

  @action
  Future<void> showCondutor(
      {required Condutor condutor,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.condutor = condutor;

      Navigator.of(context)
          .push(MaterialPageRoute(
              builder: (context) => CondutorEditScreen(this.condutor!)))
          .then((returnFromScreen) => () {
                if (returnFromScreen != null && returnFromScreen) {
                  SnackMessages.showSnackBarSuccess(
                      context, scaffoldKey, "Salvo com sucesso");

                  this.pesquisar(
                      scaffoldKey: scaffoldKey,
                      context: context,
                      search: this._lastSearch);
                }
              });
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> showAlvara(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;
    try {
      this._lastSearch = '';

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));
      //dev.debugger();
      this.condutores = (await this._condutorService.search("", super.usuario!))
          .map((model) => Condutor.fromJson(model))
          .toList();
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> editFotoCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CondutorFotoScreen()));

      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      solicitacaoExistente = (await _solicitacaoService.searchForSolicitacoes(
                  SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_FOTO,
                  condutor!.id.toString(),
                  true,
                  super.usuario!))
              .length >
          0;
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }

  @action
  Future<void> editCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int tipoDaSolicitacao,
      required Widget screenToOpen}) async {
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
          (await _solicitacaoService.searchForSolicitacoes(tipoDaSolicitacao,
              condutor!.id.toString(), true, super.usuario!));

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

  /////////////////////////
  /////////////////////////

  @action
  Future<void> saveFotoCondutor(
      {required String foto,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (foto == null || foto.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Nenhuma foto selecionada.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao!.referenciaId = condutor!.id.toString();
        this.solicitacaoDeAlteracao!.arquivo1 = foto;
        solicitacaoDeAlteracao!.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_FOTO.toString();

        await this
            ._solicitacaoService
            .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!);

        this.showDialogMessageAfterCreateSolicitacao(
            "Foto salva com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveContatoCondutor({
    required String email,
    required String ddd,
    required String telefone,
    required String celular,
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      this.solicitacaoDeAlteracao!.referenciaId = condutor!.id.toString();
      this.solicitacaoDeAlteracao!.tipoSolicitacaoId =
          SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CONTATO.toString();
      this.solicitacaoDeAlteracao!.campo1 = email;
      this.solicitacaoDeAlteracao!.campo2 = ddd;
      this.solicitacaoDeAlteracao!.campo3 = telefone;
      this.solicitacaoDeAlteracao!.campo4 = celular;

      await this
          ._solicitacaoService
          .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!);

      this.showDialogMessageAfterCreateSolicitacao(
          "Dados salvos com suscesso!", context, () {
        Navigator.of(context).pop();
      });
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveIdentidadeCondutor({
    required String nome,
    required String cpf,
    required String rg,
    required String imgComprovante,
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovante == null || imgComprovante.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Comprovante não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao!.referenciaId = condutor!.id.toString();
        this.solicitacaoDeAlteracao!.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_IDENTIDADE.toString();
        this.solicitacaoDeAlteracao!.campo1 = nome;
        this.solicitacaoDeAlteracao!.campo2 = cpf;
        this.solicitacaoDeAlteracao!.campo3 = rg;
        this.solicitacaoDeAlteracao!.arquivo1 = imgComprovante;

        await this
            ._solicitacaoService
            .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!);

        this.showDialogMessageAfterCreateSolicitacao(
            "Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveCNHCondutor({
    required String cnh,
    required String categoria,
    required DateTime validade,
    required String imgComprovante,
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovante == null || imgComprovante.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Comprovante não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao!.referenciaId = condutor!.id.toString();
        this.solicitacaoDeAlteracao!.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CNH.toString();
        this.solicitacaoDeAlteracao!.campo1 = cnh;
        this.solicitacaoDeAlteracao!.campo2 = categoria;
        this.solicitacaoDeAlteracao!.campo3 =
            Util.dateFormatyyyyMMdd.format(validade);
        this.solicitacaoDeAlteracao!.arquivo1 = imgComprovante;

        await this
            ._solicitacaoService
            .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!);

        this.showDialogMessageAfterCreateSolicitacao(
            "Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveEnderecoCondutor({
    required String cep,
    required String endereco,
    required String numero,
    required String complemento,
    required String bairro,
    required String municipio,
    required String uf,
    required String imgComprovanteEndereco,
    required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));
      bool aux = true;
      if (imgComprovanteEndereco == null || imgComprovanteEndereco.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey,
            "Comprovante do endereço não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
        this.solicitacaoDeAlteracao!.referenciaId = condutor!.id.toString();
        this.solicitacaoDeAlteracao!.tipoSolicitacaoId =
            SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_ENDERECO.toString();
        this.solicitacaoDeAlteracao!.campo1 = cep;
        this.solicitacaoDeAlteracao!.campo2 = endereco;
        this.solicitacaoDeAlteracao!.campo3 = numero;
        this.solicitacaoDeAlteracao!.campo4 = complemento;
        this.solicitacaoDeAlteracao!.campo5 = bairro;
        this.solicitacaoDeAlteracao!.campo6 = municipio;
        this.solicitacaoDeAlteracao!.campo7 = uf;
        this.solicitacaoDeAlteracao!.arquivo1 = imgComprovanteEndereco;

        await this
            ._solicitacaoService
            .createSolicitacao(solicitacaoDeAlteracao!, super.usuario!);

        this.showDialogMessageAfterCreateSolicitacao(
            "Dados salvos com suscesso!", context, () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  ////////////////////////////////
  /////////////// NOVO CONDUTOR
  ////////////////////////////////

  @action
  Future<void> newCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
      solicitacaoDeAlteracao!.tipoSolicitacaoId = SolicitacaoDeAlteracaoService
          .TIPO_CONDUTOR_CADASTRO
          .toString(); //condutor_cadastro

      this.flagAbaDadosOk = false;
      this.flagAbaEnderecoOk = false;
      this.fotoCondutor = '';

      dynamic returnFromScreen = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewCondutorScreen()));

      if (returnFromScreen != null && returnFromScreen) {
        //SnackMessages.showSnackBarSuccess(context, scaffoldKey, "Salvo com sucesso");
        this.showDialogMessageAfterCreateSolicitacao(
            "Cadastro finalizado com sucesso! ", context, () {});

        this.pesquisar(
            scaffoldKey: scaffoldKey, context: context, search: _lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> saveAbaDadosNewCondutor(
      {required String nome,
      required String email,
      required String cpf,
      required String rg,
      required String ddd,
      required String telefone,
      required String celular,
      required String cnh,
      required String categoriaCNH,
      required String nomeCursoTaxista,
      required DateTime validadeCursoTaxista,
      required String imgComprovanteCNH,
      required DateTime vencimentoCNH,
      required String imgCPF,
      required String imgCertidaoDistribuicaoCriminal,
      required String imgAtestadoDeSaude,
      required String imgCursoTaxista,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }

      if (imgComprovanteCNH == null || imgComprovanteCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Comprovante da CNH não pode estar vazio.");
      }

      if (fotoCondutor == null || fotoCondutor.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Condutor não possui foto.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao!.campo1 = cnh;
        this.solicitacaoDeAlteracao!.campo2 = categoriaCNH;
        this.solicitacaoDeAlteracao!.campo3 =
            Util.dateFormatyyyyMMdd.format(vencimentoCNH);
        this.solicitacaoDeAlteracao!.campo4 = email;
        this.solicitacaoDeAlteracao!.campo5 = ddd;
        this.solicitacaoDeAlteracao!.campo6 = telefone;
        this.solicitacaoDeAlteracao!.campo7 = celular;
        this.solicitacaoDeAlteracao!.campo15 = nome;
        this.solicitacaoDeAlteracao!.campo16 = cpf;
        this.solicitacaoDeAlteracao!.campo17 = rg;
        this.solicitacaoDeAlteracao!.campo19 = nomeCursoTaxista;
        this.solicitacaoDeAlteracao!.campo20 =
            Util.dateFormatyyyyMMdd.format(validadeCursoTaxista);
        this.solicitacaoDeAlteracao!.arquivo1 = imgComprovanteCNH;
        this.solicitacaoDeAlteracao!.arquivo4 = imgCPF;
        this.solicitacaoDeAlteracao!.arquivo5 = imgCertidaoDistribuicaoCriminal;
        this.solicitacaoDeAlteracao!.arquivo6 = imgAtestadoDeSaude;
        this.solicitacaoDeAlteracao!.arquivo7 = imgCursoTaxista;

        this.flagAbaDadosOk = true;

        if (!this.flagAbaEnderecoOk) {
          tabController!.animateTo(1);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewCondutor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      print(e);
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveAbaEnderecoNewCondutor(
      {required String cep,
      required String endereco,
      required String numero,
      required String complemento,
      required String bairro,
      required String municipio,
      required String uf,
      required String imgComprovanteEndereco,
      required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (imgComprovanteEndereco == null || imgComprovanteEndereco.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(context, scaffoldKey,
            "Comprovante do endereço não pode estar vazio.");
      }

      if (aux) {
        this.solicitacaoDeAlteracao!.campo8 = cep;
        this.solicitacaoDeAlteracao!.campo9 = endereco;
        this.solicitacaoDeAlteracao!.campo10 = numero;
        this.solicitacaoDeAlteracao!.campo11 = complemento;
        this.solicitacaoDeAlteracao!.campo12 = bairro;
        this.solicitacaoDeAlteracao!.campo13 = municipio;
        this.solicitacaoDeAlteracao!.campo14 = uf;
        this.solicitacaoDeAlteracao!.arquivo2 = imgComprovanteEndereco;

        this.flagAbaEnderecoOk = true;

        if (!this.flagAbaDadosOk) {
          SnackMessages.showSnackBarWarning(context, scaffoldKey,
              "É necessário salvar a aba de Dados para completar o processo");
          tabController!.animateTo(0);
        } else if (this.flagAbaDadosOk && this.flagAbaEnderecoOk) {
          this._saveNewCondutor(context: context, scaffoldKey: scaffoldKey);
        }
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  Future<void> _saveNewCondutor(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    CustomDialog().showConfirmDialog(
        context: context,
        text: "Tem certeza que\ndeseja salvar?",
        voidCallbackSim: () async {
          try {
            this.solicitacaoDeAlteracao!.arquivo3 = fotoCondutor;
            await this
                ._solicitacaoService
                .createSolicitacao(this.solicitacaoDeAlteracao!, super.usuario!)
                .then((_) => Navigator.of(context).pop(true));
          } catch (e) {
            SnackMessages.showSnackBarError(
                context,
                scaffoldKey,
                ErrorHandlerUtil(e)
                    .getMessegeToUser()
                    .toString()
                    .replaceAll("endereco.", ""));
          }
        },
        voidCallbackNao: () {});
  }

  @action
  Future loadPhotoFromCondutor(Condutor condutor) async {
    try {
      fotoCondutorFile =
          await this._condutorService.downloadPhoto(condutor, super.usuario!);
    } catch (e) {
      fotoCondutorFile = null;
    }
  }
}
