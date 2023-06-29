import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/stores/fiscal/emissao_multa_store.dart';
import 'package:sa_transportes_mobile/tiles/card_veiculo_tile.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';

class EmissaoDeMultaScreen extends StatefulWidget {
  final Veiculo veiculo;
  final GlobalKey<ScaffoldState> scaffoldKey;

  EmissaoDeMultaScreen(this.veiculo, this.scaffoldKey);

  @override
  _EmissaoDeMultaScreenState createState() =>
      _EmissaoDeMultaScreenState(veiculo, scaffoldKey);
}

class _EmissaoDeMultaScreenState extends State<EmissaoDeMultaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Veiculo veiculo;

  _EmissaoDeMultaScreenState(this.veiculo, this.scaffoldKey);

  final _dateFormat = Util.dateFormatddMMyyyy;

  final currentDate = DateTime.now();

  final _dataController = MaskedTextController(
      text: Util.dateFormatddMMyyyy.format(DateTime.now()),
      mask: MaskUtil.dateMask);
  final _horaController = MaskedTextController(
      text: Util.timeFormatHHmm.format(DateTime.now()),
      mask: MaskUtil.timeMask);
  final _descricaoController = TextEditingController();
  String _image;

  @override
  Widget build(BuildContext context) {
    EmissaoMultaStore emissaoMultaStore =
        Provider.of<EmissaoMultaStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sol. Emissão de Multa',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardVeiculoTile(veiculo),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const <Widget>[
                  Text(
                    'Dados de Contato',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomInputFieldGrey(
                controller: _dataController,
                label: "Data",
                type: TextInputType.text,
                validator: ValidatorsUtil.validateDate,
                hint: "Data mm/dd/aaaa",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomInputFieldGrey(
                controller: _horaController,
                label: "Hora",
                type: TextInputType.text,
                validator: ValidatorsUtil.validateTime,
                hint: "Hora hh:mm",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomInputFieldGrey(
                controller: _descricaoController,
                label: "Descrição",
                type: TextInputType.text,
                hint: "Descrição",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomImagePickerField(
                imagePath: this._image,
                text: "Foto da Infração",
                callBack: (String imgPath) {
                  this._image = imgPath;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomRaisedButtonBlue(
                label: "Confirmar",
                func: () {
                  emissaoMultaStore.criarSolicitacaoDeInfracao(
                      veiculo: veiculo,
                      data: _dateFormat.parse(_dataController.text),
                      hora: _horaController.text,
                      descricao: _descricaoController.text,
                      foto: _image,
                      context: context,
                      scaffoldKey: scaffoldKey);
                },
              ),
            ],
          ),
        )));
  }
}
