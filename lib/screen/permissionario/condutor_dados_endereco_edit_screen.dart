import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_alert_message.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_image_picker_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadosEnderecoScreen extends StatefulWidget {
  @override
  _CondutorDadosEnderecoScreenState createState() => _CondutorDadosEnderecoScreenState();
}

class _CondutorDadosEnderecoScreenState extends State<CondutorDadosEnderecoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;

  final _cepController = MaskedTextController(mask: MaskUtil.cepMask);
  final _addressController = TextEditingController();
  final _numController = TextEditingController();
  final _complementController = TextEditingController();
  final _bairroController = TextEditingController();
  final _municipioController = TextEditingController();
  String _uf;

  @override
  void initState() {
    super.initState();
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    super.dispose();

    _cepController.dispose();
    _addressController.dispose();
    _numController.dispose();
    _complementController.dispose();
    _bairroController.dispose();
    _municipioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      if (condutorStore.solicitacaoExistente) {
        _cepController.text = condutorStore.solicitacaoDeAlteracao.campo1;
        _addressController.text = condutorStore.solicitacaoDeAlteracao.campo2;
        _numController.text = condutorStore.solicitacaoDeAlteracao.campo3;
        _complementController.text = condutorStore.solicitacaoDeAlteracao.campo4;
        _bairroController.text = condutorStore.solicitacaoDeAlteracao.campo5;
        _municipioController.text = condutorStore.solicitacaoDeAlteracao.campo6;
        _uf = condutorStore.solicitacaoDeAlteracao.campo7;
      } else {
        _cepController.text = condutorStore.condutor.endereco.cep;
        _addressController.text = condutorStore.condutor.endereco.endereco;
        _numController.text = condutorStore.condutor.endereco.numero;
        _complementController.text = condutorStore.condutor.endereco.complemento;
        _bairroController.text = condutorStore.condutor.endereco.bairro;
        _municipioController.text = condutorStore.condutor.endereco.municipio;
        _uf = condutorStore.condutor.endereco.uf;
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados Endereço",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Observer(builder: (_) {
              if (condutorStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    condutorStore.solicitacaoExistente
                        ? CustomAlertMessage(
                      type: CustomAlertMessage.WANNING,
                      message: "Já existe uma solicitação em andanmento! Uma nova alteração irá cancelar a solicitação anterior.",
                    )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Dados de Endereço",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _cepController,
                                  label: "CEP",
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateCEP,
                                  hint: "CEP",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _addressController,
                                  label: "ENDEREÇO",
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "ENDEREÇO",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _numController,
                                  label: "NÚMERO",
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateNumber,
                                  hint: "NÚMERO",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _complementController,
                                  label: "COMPLEMENTO",
                                  type: TextInputType.text,
                                  hint: "COMPLEMENTO",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _bairroController,
                            label: "BAIRRO",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "BAIRRO",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _municipioController,
                                  label: "MUNICÍPIO",
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "MUNICÍPIO",
                                ),
                              ),
                              Spacer(),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.43,
                                  child: CustomDropdown(
                                    dropdownValues: Util.UFs,
                                    hint: Text("UF"),
                                    value: this._uf,
                                    onChanged: (newValue) {
                                      setState(() {
                                        this._uf = newValue;
                                      });
                                    },
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomImagePickerField(
                            imagePath: this._image,
                            text: "Comprovante de Endereço",
                            callBack: (String imgPath) {
                              this._image = imgPath;
                            },
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Salvar",
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        condutorStore.saveEnderecoCondutor(
                                            cep: Util.clearString(this._cepController.text),
                                            endereco: this._addressController.text,
                                            complemento: this._complementController.text,
                                            bairro: this._bairroController.text,
                                            numero: this._numController.text,
                                            municipio: this._municipioController.text,
                                            uf: this._uf,
                                            imgComprovanteEndereco: this._image,
                                            context: context,
                                            scaffoldKey: _scaffoldKey);
                                      },
                                      voidCallbackNao: () {});
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
