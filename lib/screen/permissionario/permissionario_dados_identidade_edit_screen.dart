import 'dart:io';

import 'package:cityconnect/stores/permissionario/permissionario_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_alert_message.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadoIsdentidadeScreen extends StatefulWidget {
  @override
  _CondutorDadoIsdentidadeScreenState createState() => _CondutorDadoIsdentidadeScreenState();
}

class _CondutorDadoIsdentidadeScreenState extends State<CondutorDadoIsdentidadeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;
  final picker = ImagePicker();

  final _nomeController = TextEditingController();
  TextEditingController _documentController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _dataNascimentoController = MaskedTextController(mask: MaskUtil.dateMask);

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagCPF = true;
  bool _flagIsLoad = false;

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _documentController.dispose();
    _rgController.dispose();
    _natController.dispose();
    _nacController.dispose();
    _dataNascimentoController.dispose();
  }

  void _controllerMaskCPFCNPJ(String valor) {
    if (valor.length > 14 && _flagCPF) {
      _flagCPF = false;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.cnpjMask, value: valor);
      });
    } else if (valor.length <= 14 && !_flagCPF) {
      _flagCPF = true;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.cpfMask, value: valor);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PermissionarioStore permissionarioStore = Provider.of<PermissionarioStore>(context);

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
              if (permissionarioStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              //Setando dados carregados após loader
              if (!this._flagIsLoad) {
                this._flagIsLoad = true;
                if (permissionarioStore.solicitacaoExistente) {
                  _nomeController.text = permissionarioStore.solicitacaoDeAlteracao.campo1;
                  _documentController.text = permissionarioStore.solicitacaoDeAlteracao.campo2;
                  _rgController.text = permissionarioStore.solicitacaoDeAlteracao.campo3;
                  _natController.text = permissionarioStore.solicitacaoDeAlteracao.campo5;
                  _nacController.text = permissionarioStore.solicitacaoDeAlteracao.campo6;
                  _dataNascimentoController.text = permissionarioStore.solicitacaoDeAlteracao.campo4 != null
                      ? Util.convertyyyyMMddToddMMyyyy(permissionarioStore.solicitacaoDeAlteracao.campo4)
                      : null;
                } else {
                  _nomeController.text = permissionarioStore.usuario.permissionario.nome;
                  _documentController.text = permissionarioStore.usuario.permissionario.cpfCnpj;
                  _rgController.text = permissionarioStore.usuario.permissionario.rg;
                  _natController.text = permissionarioStore.usuario.permissionario.naturalidade;
                  _nacController.text = permissionarioStore.usuario.permissionario.nacionalidade;
                  _dataNascimentoController.text = permissionarioStore.usuario.permissionario.dataNascimento != null
                      ? this._dateFormat.format(permissionarioStore.usuario.permissionario.dataNascimento)
                      : null;
                }
              }

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    permissionarioStore.solicitacaoExistente
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
                            controller: _nomeController,
                            label: "NOME",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "NOME",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _documentController,
                                  label: "CPF/CNPJ",
                                  type: TextInputType.text,
                                  enabled: false,
                                  hint: "CPF",
                                  onChanged: _controllerMaskCPFCNPJ,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _rgController,
                                  label: "RG",
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "RG",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _dataNascimentoController,
                            label: "DATA NASCIMENTO",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateDate,
                            hint: "DATA NASCIMENTO",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _natController,
                                  label: "NATURALIDADE",
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "NATURALIDADE",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _nacController,
                                  label: "NACIONALIDADE",
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "NACIONALIDADE",
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
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        // mainStore.saveUser(
                                        //     nome: this._nomeController.text,
                                        //     cnh: this._cnhController.text,
                                        //     categoriaCNH: this._categoriaCNH,
                                        //     celular: Util.clearString(this._celController.text),
                                        //     dataNascimento: this._dateFormat.parse(
                                        //         this._dataNascimentoController.text),
                                        //     ddd: this._dddController.text,
                                        //     inscricaoMunicipal:
                                        //     this._inscricaoMunicipalController.text,
                                        //     nacionalidade: this._nacController.text,
                                        //     naturalidade: this._natController.text,
                                        //     rg: this._rgController.text,
                                        //     telefone: Util.clearString(this._phoneController.text),
                                        //     telefone2: Util.clearString(this._phone2Controller.text),
                                        //     vencimentoCNH: this._dateFormat.parse(
                                        //         this._vencimentoCNHController.text),
                                        //     context: context,
                                        //     scaffoldKey: _scaffoldKey);
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
