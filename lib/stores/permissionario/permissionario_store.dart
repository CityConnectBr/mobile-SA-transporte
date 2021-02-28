import 'dart:io';

import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/screen/permissionario/permissionario_foto_edit_screen.dart';
import 'package:cityconnect/services/permissionario_service.dart';
import 'package:cityconnect/services/solicitacao_alteracao_service.dart';
import 'package:cityconnect/stores/main_store.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'permissionario_store.g.dart';

class PermissionarioStore = _PermissionarioStore with _$PermissionarioStore;

abstract class _PermissionarioStore extends MainStore with Store {
  SolicitacaoDeAlteracao solicitacaoDeAlteracao;

  final _permissionarioService = PermissionarioService();
  final _solicitacaoService = SolicitacaoDeAlteracaoService();

  String fotoCondutor;

  TabController tabController;

  bool flagAbaDadosOk = false;
  bool flagAbaEnderecoOk = false;


  @action
  Future<void> editPermissionario(
      {@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey, @required int tipoDaSolicitacao, Widget screenToOpen}) async {
    try {
      this.loading = true;

      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenToOpen));

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      List<SolicitacaoDeAlteracao> solicitacoesEmAberto =
      (await _solicitacaoService.searchForSolicitacoes(tipoDaSolicitacao, super.usuario.permissionario.id.toString(), true, super.usuario));

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
  Future<void> editFoto({@required BuildContext context, @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      this.loading = true;

      solicitacaoDeAlteracao = null; //zerando solicitacao
      solicitacaoExistente = false; //zerando solicitacao

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PermissionarioFotoScreen()));

      assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));

      //verificar se existe solicitacoes pendentes
      solicitacaoExistente =
          (await _solicitacaoService.searchForSolicitacoes(SolicitacaoDeAlteracaoService.TIPO_PERMISSIONARIO_FOTO, usuario.permissionario.id.toString(), true, super.usuario))
              .length >
              0;
    } catch (e) {
      SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
    this.loading = false;
  }


  /////////////////////////
  /////////////////////////

  @action
  Future<void> saveFoto({String foto, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
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
        this.solicitacaoDeAlteracao.referenciaId = usuario.permissionario.id.toString();
        this.solicitacaoDeAlteracao.arquivo1 = foto;
        solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_PERMISSIONARIO_FOTO.toString();

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
  //
  // @action
  // Future<void> saveContatoCondutor({
  //   String email,
  //   String ddd,
  //   String telefone,
  //   String celular,
  //   BuildContext context,
  //   GlobalKey<ScaffoldState> scaffoldKey,
  // }) async {
  //   loading = true;
  //
  //   try {
  //     assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));
  //
  //     this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
  //     this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
  //     this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CONTATO.toString();
  //     this.solicitacaoDeAlteracao.campo1 = email;
  //     this.solicitacaoDeAlteracao.campo2 = ddd;
  //     this.solicitacaoDeAlteracao.campo3 = telefone;
  //     this.solicitacaoDeAlteracao.campo4 = celular;
  //
  //     await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);
  //
  //     this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
  //       Navigator.of(context).pop();
  //     });
  //   } catch (e) {
  //     SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
  //   }
  //
  //   loading = false;
  // }
  //
  // @action
  // Future<void> saveIdentidadeCondutor({
  //   String nome,
  //   String cpf,
  //   String rg,
  //   String imgComprovante,
  //   BuildContext context,
  //   GlobalKey<ScaffoldState> scaffoldKey,
  // }) async {
  //   loading = true;
  //
  //   try {
  //     assert(await isLoggedInWithRedirect(context: context, redirectToHomeIfLogged: false));
  //     bool aux = true;
  //     if (imgComprovante == null || imgComprovante.isEmpty) {
  //       aux = false;
  //       SnackMessages.showSnackBarError(context, scaffoldKey, "Comprovante não pode estar vazio.");
  //     }
  //
  //     if (aux) {
  //       this.solicitacaoDeAlteracao = SolicitacaoDeAlteracao();
  //       this.solicitacaoDeAlteracao.referenciaId = condutor.id.toString();
  //       this.solicitacaoDeAlteracao.tipoSolicitacaoId = SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_IDENTIDADE.toString();
  //       this.solicitacaoDeAlteracao.campo1 = nome;
  //       this.solicitacaoDeAlteracao.campo2 = cpf;
  //       this.solicitacaoDeAlteracao.campo3 = rg;
  //       this.solicitacaoDeAlteracao.arquivo1 = imgComprovante;
  //
  //       await this._solicitacaoService.createSolicitacao(solicitacaoDeAlteracao, super.usuario);
  //
  //       this.showDialogMessageAfterCreateSolicitacao("Dados salvos com suscesso!", context, () {
  //         Navigator.of(context).pop();
  //       });
  //     }
  //   } catch (e) {
  //     SnackMessages.showSnackBarError(context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
  //   }
  //
  //   loading = false;
  // }


}
