import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
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
  String _image = "";
  final picker = ImagePicker();

  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();

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
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

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
                  _nomeController.text = condutorStore.solicitacaoDeAlteracao?.campo1?? "";
                  _cpfController.text = condutorStore.solicitacaoDeAlteracao?.campo2?? "";
                  _rgController.text = condutorStore.solicitacaoDeAlteracao?.campo3?? "";
                } else {
                  _nomeController.text = condutorStore.condutor?.nome?? "";
                  _cpfController.text = condutorStore.condutor?.cpf?? "";
                  _rgController.text = condutorStore.condutor?.rg?? "";
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
                                  inputFormatters: [CpfInputFormatter()],
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
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomImagePickerField(
                            imagePath: this._image,
                            text: "Foto da Identidade ou CNH",
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
                                if (_formKey.currentState!.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        condutorStore.saveIdentidadeCondutor(
                                            nome: this._nomeController.text,
                                            cpf: Util.clearString(this._cpfController.text),
                                            rg: this._rgController.text,
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
