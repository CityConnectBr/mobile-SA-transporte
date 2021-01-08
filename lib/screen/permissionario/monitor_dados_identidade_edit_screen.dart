import 'dart:io';

import 'package:cityconnect/stores/permissionario/monitor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_alert_message.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_image_picker_field.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MonitorDadoIsdentidadeScreen extends StatefulWidget {
  @override
  _MonitorDadoIsdentidadeScreenState createState() => _MonitorDadoIsdentidadeScreenState();
}

class _MonitorDadoIsdentidadeScreenState extends State<MonitorDadoIsdentidadeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;
  final picker = ImagePicker();

  final _nomeController = TextEditingController();
  TextEditingController _cpfController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _dataNascController = MaskedTextController(mask: MaskUtil.dateMask);

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagIsLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _dataNascController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

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
              if (monitorStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              //Setando dados carregados após loader
              if (!this._flagIsLoad) {
                this._flagIsLoad = true;
                if (monitorStore.solicitacaoExistente) {
                  _nomeController.text = monitorStore.solicitacaoDeAlteracao.campo1;
                  _cpfController.text = monitorStore.solicitacaoDeAlteracao.campo2;
                  _rgController.text = monitorStore.solicitacaoDeAlteracao.campo3;
                  _dataNascController.text =
                  monitorStore.solicitacaoDeAlteracao.campo4 != null ? Util.convertyyyyMMddToddMMyyyy(monitorStore.solicitacaoDeAlteracao.campo4) : "";
                } else {
                  _nomeController.text = monitorStore.monitor.nome;
                  _cpfController.text = monitorStore.monitor.cpf;
                  _rgController.text = monitorStore.monitor.rg;
                  _dataNascController.text = monitorStore.monitor.dataNascimento != null ? Util.dateFormatddMMyyyy.format(monitorStore.monitor.dataNascimento) : "";
                }
              }

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    monitorStore.solicitacaoExistente
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
                                "Dados de identidade",
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
                                  controller: _cpfController,
                                  label: "CPF",
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateCPF,
                                  hint: "CPF",
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
                            controller: _dataNascController,
                            label: "DATA NASC.",
                            type: TextInputType.text,
                            hint: "DATA NASCIMENTO",
                            validator: ValidatorsUtil.validateDate,
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomImagePickerField(
                            imagePath: this._image,
                            text: "Foto da Identidade",
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
                                        monitorStore.saveIdentidadeMonitor(
                                            nome: this._nomeController.text,
                                            cpf: Util.clearString(this._cpfController.text),
                                            rg: this._rgController.text,
                                            dataNasc: Util.dateFormatddMMyyyy.parse(this._dataNascController.text),
                                            imgComprovante: this._image,
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
