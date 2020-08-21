import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/screen/user_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EditInformationTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  EditInformationTile(this._globalKey);

  @override
  _EditInformationTileState createState() =>
      _EditInformationTileState(_globalKey);
}

class _EditInformationTileState extends State<EditInformationTile> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _inscricaoMunicipalController = TextEditingController();
  final _dataController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phone2Controller = TextEditingController();
  final _celController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnhController = TextEditingController();
  String text = "(##) ####-####";

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _EditInformationTileState(this._scaffoldKey);

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _natController.dispose();
    _nacController.dispose();
    _inscricaoMunicipalController.dispose();
    _dataController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _celController.dispose();
    _emailController.dispose();
    _cnhController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    // return Container(
    //   padding: EdgeInsets.all(20.0),
    //   child: Observer(builder: (_) {
    //     if (loginStore.loading)
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );

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
                CustomFormInputField(
                  controller: _nomeController,
                  label: "NOME",
                  obscure: false,
                  type: TextInputType.emailAddress,
                  validator: ValidatorsUtil.validateEmail,
                  hint: "NOME",
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cpfController,
                        label: "CPF/CNPJ",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "CPF",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _rgController,
                        label: "RG",
                        obscure: false,
                        type: TextInputType.text,
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
                      child: CustomFormInputField(
                        controller: _natController,
                        label: "NATURALIDADE",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "NATURALIDADE",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _nacController,
                        label: "NACIONALIDADE",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "NACIONALIDADE",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _inscricaoMunicipalController,
                  label: "INSCRIÇÃO MUNICIPAL",
                  obscure: false,
                  type: TextInputType.text,
                  hint: "INSCRIÇÃO MUNICIPAL",
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _dataController,
                        label: "DATA NASCIMENTO",
                        obscure: false,
                        validator: ValidatorsUtil.validateDate,
                        hint: "DATA NASCIMENTO",
                        /*maskTextInputFormatter: MaskTextInputFormatter(
                            mask: "##/##/####",
                            filter: {"#": RegExp(r'[0-9]')}),*/
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _phoneController,
                        label: "TELEFONE",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "TELEFONE",
                        /*maskTextInputFormatter: MaskTextInputFormatter(
                          mask: '(##) ####-####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),*/
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
                      child: CustomFormInputField(
                        controller: _phone2Controller,
                        label: "TELEFONE 2",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "TELEFONE 2",
                        /*maskTextInputFormatter: MaskTextInputFormatter(
                          mask: '(##) ####-####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),*/
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _celController,
                        label: "CELULAR",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "CELULAR",
                        /*maskTextInputFormatter: MaskTextInputFormatter(
                          mask: '(##) #####-####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),*/
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _emailController,
                  label: "E-MAIL",
                  obscure: false,
                  type: TextInputType.text,
                  hint: "E-MAIL",
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _cnhController,
                  label: "CNH",
                  obscure: false,
                  type: TextInputType.text,
                  hint: "CNH",
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cpfController,
                        label: "CATEGORIA",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "CATEGORIA",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cpfController,
                        label: "VENCIMENTO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "VENCIMENTO",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _cnhController,
                  label: "MODALIDADE",
                  obscure: false,
                  type: TextInputType.text,
                  hint: "MODALIDADE",
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cpfController,
                        label: "IDENTIFICADOR",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "IDENTIFICADOR",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cpfController,
                        label: "DESCRIÇÃO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "DESCRIÇÃO",
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
                    // if (_formKey.currentState.validate()) {
                    //   loginStore.login(
                    //       email: _emailController.text,
                    //       senha: _senhaController.text,
                    //       context: context,
                    //       scaffoldKey: _scaffoldKey);
                    // }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 210.0,
                            child: Column(
                              children: [
                                Image.asset("images/check-dialog.png"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Tem certeza que\ndeseja alterar?",
                                  style: TextStyle(
                                    fontFamily: "InterBold",
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: FlatButton(
                                        child: Text(
                                          "Sim",
                                          style: TextStyle(
                                            fontFamily: "InterBold",
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()));
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                        color: Util.hexToColor("#2D9CDB"),
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Util.hexToColor("#1069E3")
                                                .withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      child: FlatButton(
                                        child: Text(
                                          "Não",
                                          style: TextStyle(
                                            fontFamily: "InterBold",
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                        color: Util.hexToColor("#FFFFFF"),
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // }),
    // );
  }
}
