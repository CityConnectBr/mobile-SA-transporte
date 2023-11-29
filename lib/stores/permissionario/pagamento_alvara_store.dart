import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:sa_transportes_mobile/models/alvara_model.dart';
import 'package:sa_transportes_mobile/services/alvara_service.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/error_handler_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';

part 'pagamento_alvara_store.g.dart';

class ParamengoAlvaraStore = _ParamengoAlvaraStore with _$ParamengoAlvaraStore;

abstract class _ParamengoAlvaraStore extends MainStore with Store {
  final _alvaraService = AlvaraService();

  @observable
  Alvara? alvara;

  @action
  Future<void> loadAlvara(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required int alvaraId}) async {
    loading = true;

    try {
      assert(await isLoggedInWithRedirect(
          context: context, redirectToHomeIfLogged: false));

      alvara =
          Alvara.fromJson(await _alvaraService.get(alvaraId, super.usuario!));
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> informarPagamento(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Alvara alvara}) async {
    loading = true;

    try {
      final _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null && pickedFile.path != null) {
        await _alvaraService.pagar(
            alvara.id.toString(), File(pickedFile.path), super.usuario!);

        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, 'Infracao foi informada como paga');

        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      } else {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, 'Nenhuma imagem selecionada');
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    } finally {
      loading = false;
    }
  }

  @action
  String gerarPIX(Alvara alvara) {
    PixFlutter pixFlutter = PixFlutter(
        payload: Payload(
            pixKey: alvara.chavePix,
            description: 'Multa_SA_Transportes',
            merchantName:
                alvara.empresaNome!.replaceAll(' ', '_'), // Nome da empresa
            merchantCity:
                alvara.municipio!.replaceAll(' ', '_'), // Cidade da empresa
            txid: "TXID${alvara.id}", // ID da transação
            amount: Util.formatMoneyToDouble(alvara.valor.toString())));

    return pixFlutter.getQRCode();
  }

  @action
  void copyToClipboard(String text, BuildContext context, GlobalKey key) {
    Util.copyToClipboard(text);
    SnackMessages.showSnackBarSuccess(
        context, null, 'Chave copiada para área de transferência');
  }
}
