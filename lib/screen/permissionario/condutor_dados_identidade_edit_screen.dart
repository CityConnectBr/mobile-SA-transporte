import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_image_picker_field.dart';
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
  TextEditingController _cpfController = MaskedTextController(mask: MaskUtil.cpfMask);
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

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      if (condutorStore.solicitacaoExistente) {
        _nomeController.text = condutorStore.solicitacaoDeAlteracao.campo1;
        _cpfController.text = condutorStore.solicitacaoDeAlteracao.campo2;
        _rgController.text = condutorStore.solicitacaoDeAlteracao.campo3;
      } else {
        _nomeController.text = condutorStore.condutor.nome;
        _cpfController.text = condutorStore.condutor.cpf;
        _rgController.text = condutorStore.condutor.rg;
      }
    }

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

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                                if (_formKey.currentState.validate()) {
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
