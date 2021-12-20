import 'dart:io';

import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadosContatoScreen extends StatefulWidget {
  @override
  _CondutorDadosContatoScreenState createState() => _CondutorDadosContatoScreenState();
}

class _CondutorDadosContatoScreenState extends State<CondutorDadosContatoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;
  final picker = ImagePicker();

  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _phone2Controller = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController =
  MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  void _controllerMaskCelular(String valor) {
    if (valor.length > 9 && _flagCelular) {
      _flagCelular = false;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.telefone9Mask, value: valor);
      });
    } else if (valor.length <= 9 && !_flagCelular) {
      _flagCelular = true;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.telefone8Mask, value: valor);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _dddController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _celController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);
    condutorStore.loadUsuario();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados Identidade",
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

              //Setando dados carregados após loader
              if (!this._flagIsLoad) {
                this._flagIsLoad = true;
                if (condutorStore.solicitacaoExistente) {
                  _emailController.text = condutorStore.solicitacaoDeAlteracao.campo1;
                  _dddController.text = condutorStore.solicitacaoDeAlteracao.campo2;
                  _phoneController.text = condutorStore.solicitacaoDeAlteracao.campo3;
                  _phone2Controller.text = condutorStore.solicitacaoDeAlteracao.campo4;
                  _celController.text = condutorStore.solicitacaoDeAlteracao.campo5;
                } else if(condutorStore.usuarioLogado!=null){
                  _dddController.text = condutorStore.usuarioLogado.permissionario.ddd;
                  _phoneController.text = condutorStore.usuarioLogado.permissionario.telefone;
                  _phone2Controller.text = condutorStore.usuarioLogado.permissionario.telefone2;
                  _celController.text = condutorStore.usuarioLogado.permissionario.celular;
                  _emailController.text = condutorStore.usuarioLogado.permissionario.email;
                }
              }

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
                          CustomInputFieldGrey(
                            controller: _emailController,
                            label: "E-MAIL",
                            type: TextInputType.text,
                            hint: "E-MAIL",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _dddController,
                                  label: "DDD",
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateNumber,
                                  hint: "DDD",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _phoneController,
                                  label: "TELEFONE",
                                  type: TextInputType.number,
                                  hint: "TELEFONE",
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
                                  controller: _phone2Controller,
                                  label: "TELEFONE 2",
                                  type: TextInputType.number,
                                  hint: "TELEFONE 2",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _celController,
                                  label: "CELULAR",
                                  type: TextInputType.number,
                                  hint: "CELULAR",
                                  onChanged: _controllerMaskCelular,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Salvar",
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  // CustomDialog().showConfirmDialog(
                                  //     context: context,
                                  //     text: "Tem certeza que\ndeseja salvar?",
                                  //     voidCallbackSim: () {
                                  //       mainStore.saveUser(
                                  //           nome: this._nomeController.text,
                                  //           cnh: this._cnhController.text,
                                  //           categoriaCNH: this._categoriaCNH,
                                  //           celular: Util.clearString(this._celController.text),
                                  //           dataNascimento: this._dateFormat.parse(
                                  //               this._dataNascimentoController.text),
                                  //           ddd: this._dddController.text,
                                  //           inscricaoMunicipal:
                                  //           this._inscricaoMunicipalController.text,
                                  //           nacionalidade: this._nacController.text,
                                  //           naturalidade: this._natController.text,
                                  //           rg: this._rgController.text,
                                  //           telefone: Util.clearString(this._phoneController.text),
                                  //           telefone2: Util.clearString(this._phone2Controller.text),
                                  //           vencimentoCNH: this._dateFormat.parse(
                                  //               this._vencimentoCNHController.text),
                                  //           context: context,
                                  //           scaffoldKey: _scaffoldKey);
                                  //     },
                                  //     voidCallbackNao: () {}
                                  // );
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
