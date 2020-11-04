import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadoIdentidadeScreen extends StatefulWidget {
  final Condutor _condutor;

  CondutorDadoIdentidadeScreen(this._condutor);

  @override
  _CondutorDadoIdentidadeScreenState createState() =>
      _CondutorDadoIdentidadeScreenState(this._condutor);
}

class _CondutorDadoIdentidadeScreenState
    extends State<CondutorDadoIdentidadeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;
  final picker = ImagePicker();
  final Condutor _condutor;

  _CondutorDadoIdentidadeScreenState(this._condutor);

  final _nomeController = TextEditingController();
  TextEditingController _cpfController =
      MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _dataNascimentoController =
      MaskedTextController(mask: MaskUtil.dateMask);

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
    _natController.dispose();
    _nacController.dispose();
    _dataNascimentoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _nomeController.text = this._condutor.nome;
      _cpfController.text = Util.clearString(this._condutor.cpf);
      _rgController.text = this._condutor.rg;
      _natController.text = this._condutor.naturalidade;
      _nacController.text = this._condutor.nacionalidade;
      _dataNascimentoController.text = this._condutor.dataNascimento != null
          ? this._dateFormat.format(this._condutor.dataNascimento)
          : null;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados Identidade",
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
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
                            height: 30.0,
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: _image != null ?

                              Image.asset(
                                "${_image}",
                                height: 140,
                                fit: BoxFit.contain,
                              ) : Text(
                                "Nenhuma imagem selecionada",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            onTap: () async {
                              final pickedFile = await picker.getImage(source: ImageSource.camera);



                              setState(() {

                                if (pickedFile != null) {
                                  print(pickedFile.path);
                                  _image = pickedFile.path;
                                  print(_image);
                                } else {
                                  print('No image selected.');
                                }
                              });
                            },
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
                                        condutorStore.save(
                                            nome: this._nomeController.text,
                                            cpf: Util.clearString(
                                                this._cpfController.text),
                                            dataNascimento: this
                                                ._dateFormat
                                                .parse(this
                                                    ._dataNascimentoController
                                                    .text),
                                            nacionalidade:
                                                this._nacController.text,
                                            naturalidade:
                                                this._natController.text,
                                            rg: this._rgController.text,
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
