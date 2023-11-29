import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sa_transportes_mobile/stores/permissionario/solicitacao_alvara_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_dropdown.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';

class RenewAlvaraScreen extends StatefulWidget {
  @override
  _RenewAlvaraScreenState createState() => _RenewAlvaraScreenState();
}

class _RenewAlvaraScreenState extends State<RenewAlvaraScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final _categoriaCNH = TextEditingController();
  final _vencimentoGNVController = TextEditingController();
  final _vencimentoCNHController = TextEditingController();
  final _vencimentoDistribuicaoCriminalController = TextEditingController();
  String _imageCRLV = "";
  String _imageComprovanteAfericaoTaximetro = "";
  String _imageComprovanteResidencia = "";
  String _imageCNH = "";
  String _imageComprovanteLaudoVistoria = "";
  String _imageComprovanteDistribuicaoCriminal = "";
  String _imageSeloGNV = "";
  String _possuiGNV = "";
  String _mudancaEndereco = "";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _categoriaCNH.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SolicitacaoAlvaraStore _store =
        Provider.of<SolicitacaoAlvaraStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Solitação de Renovação de Alvará',
        ),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Container(
          child: Observer(builder: (_) {
            if (_store.loading)
              return Container(
                margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            return Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GNV",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomDropdown(
                      dropdownValues: <String>[
                        'Sim',
                        'Não',
                      ],
                      label: "Possui GNV?",
                      value: this._possuiGNV,
                      onChanged: (newValue) {
                        setState(() {
                          print(newValue);
                          this._possuiGNV = newValue;
                          //this._selectedCategory = newValue;
                        });
                      },
                    ),
                    if (this._possuiGNV == "Sim")
                      Column(
                        children: [
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 32.0,
                              ),
                              CustomImagePickerField(
                                imagePath: this._imageSeloGNV,
                                text: "Foto do Selo GNV",
                                callBack: (String imgPath) {
                                  this._imageSeloGNV = imgPath;
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _vencimentoGNVController,
                            label: "VALIDADE GNV",
                            type: TextInputType.text,
                            hint: "VALIDADE GNV",
                            validator: ValidatorsUtil.validateDateOrEmpty,
                            inputFormatters: [
                              // obrigatório
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter()
                            ],
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Endereço",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomDropdown(
                      dropdownValues: <String>[
                        'Sim',
                        'Não',
                      ],
                      hint: Text("Ocorreu mudança de endereço?"),
                      value: this._mudancaEndereco,
                      onChanged: (newValue) {
                        setState(() {
                          print(newValue);
                          this._mudancaEndereco = newValue;
                        });
                      },
                    ),
                    this._mudancaEndereco == "Sim"
                        ? Column(
                            children: <Widget>[
                              SizedBox(
                                height: 32.0,
                              ),
                              CustomImagePickerField(
                                imagePath: this._imageComprovanteResidencia,
                                text: "Foto Comprovante de Residência",
                                callBack: (String imgPath) {
                                  this._imageComprovanteResidencia = imgPath;
                                },
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Outros Dados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _vencimentoCNHController,
                      label: "VENCIEMNTO CNH",
                      type: TextInputType.text,
                      hint: "VENCIEMNTO CNH",
                      validator: ValidatorsUtil.validateDate,
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter()
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _vencimentoDistribuicaoCriminalController,
                      label: "VENCTO DISTRIBUIÇÃO CRIMINAL",
                      type: TextInputType.text,
                      hint: "VENCTO DISTRIBUIÇÃO CRIMINAL",
                      validator: ValidatorsUtil.validateDate,
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter()
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._imageCRLV,
                      text: "Foto do CRLV",
                      callBack: (String imgPath) {
                        this._imageCRLV = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._imageComprovanteAfericaoTaximetro,
                      text: "Comprovante de Aferição do Taxímetro",
                      callBack: (String imgPath) {
                        this._imageComprovanteAfericaoTaximetro = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._imageCNH,
                      text: "Foto da CNH",
                      callBack: (String imgPath) {
                        this._imageCNH = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._imageComprovanteLaudoVistoria,
                      text: "Laudo de Vistoria",
                      callBack: (String imgPath) {
                        this._imageComprovanteLaudoVistoria = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._imageComprovanteDistribuicaoCriminal,
                      text: "Distribuição Criminal",
                      callBack: (String imgPath) {
                        this._imageComprovanteDistribuicaoCriminal = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            _store.solicitarNovoAlvara(
                                possuiGNV:
                                    this._possuiGNV == "Sim" ? true : false,
                                dataVencimentoGNV: _vencimentoGNVController.text.isEmpty
                                    ? null
                                    : Util.dateFormatddMMyyyy
                                        .parse(_vencimentoGNVController.text),
                                ocorreuMudancaEndereco:
                                    this._mudancaEndereco == "Sim"
                                        ? true
                                        : false,
                                dataVencimentoCNH: Util.dateFormatddMMyyyy
                                    .parse(_vencimentoCNHController.text),
                                dataVencimentoDistribuicaoCriminal:
                                    Util.dateFormatddMMyyyy.parse(
                                        _vencimentoDistribuicaoCriminalController
                                            .text),
                                fotoCNH: this._imageCNH,
                                fotoCRLV: this._imageCRLV,
                                fotoComprovanteAfericaoTaximetro:
                                    this._imageComprovanteAfericaoTaximetro,
                                fotoComprovanteResidencia:
                                    this._imageComprovanteResidencia,
                                fotoComprovanteLaudoVistoria:
                                    this._imageComprovanteLaudoVistoria,
                                fotoComprovanteDistribuicaoCriminal:
                                    this._imageComprovanteDistribuicaoCriminal,
                                fotoGNV: this._imageSeloGNV,
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        }),
                  ],
                ),
              ),
            );
          }),
        ),
      ]),
    );
  }
}
