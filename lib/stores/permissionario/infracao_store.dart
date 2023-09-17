import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:sa_transportes_mobile/models/infracao_model.dart';
import 'package:sa_transportes_mobile/services/infracao_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';

part 'infracao_store.g.dart';

class InfracaoStore = _InfracaoStore with _$InfracaoStore;

abstract class _InfracaoStore extends MainStore with Store {
  @observable
  List<Infracao>? infracoes;

  final _infracaoService = InfracaoService();

  @action
  Future<void> loadList(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      infracoes = (await _infracaoService.loadAll(super.usuario!))
          .map((model) => Infracao.fromJson(model))
          .toList();
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> pagar(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Infracao infracao}) async {
    loading = true;

    try {
      final _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null && pickedFile.path != null) {
        await _infracaoService.pagar(
            infracao.id!, File(pickedFile.path), super.usuario!);

        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, 'Infracao foi informada como paga');

        await loadList(context: context, scaffoldKey: scaffoldKey);
      } else {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, 'Nenhuma imagem selecionada');
      }

      loadList(context: context, scaffoldKey: scaffoldKey);
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    } finally {
      loading = false;
    }
  }

  @action
  String gerarPIX(Infracao infracao) {
    PixFlutter pixFlutter = PixFlutter(
        payload: Payload(
            pixKey: infracao.chavePix,
            description: 'Multa_SA_Transportes',
            merchantName:
                infracao.empresaNome!.replaceAll(' ', '_'), // Nome da empresa
            merchantCity:
                infracao.municipio!.replaceAll(' ', '_'), // Cidade da empresa
            txid: "TXID${infracao.id}", // ID da transação
            amount: Util.formatMoneyToDouble(infracao.valor.toString())));

    return pixFlutter.getQRCode();
  }

  @action
  void copyToClipboard(String text, BuildContext context, GlobalKey key) {
    Util.copyToClipboard(text);
    SnackMessages.showSnackBarSuccess(
        context, null, 'Chave copiada para área de transferência');
  }
}
