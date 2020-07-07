import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _cpfController = MaskedTextController(text: '', mask: '000.000.000-00');
  final _matController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();

    _cpfController.dispose();
    _matController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Util.hexToColor("#000000"),
        appBar: AppBar(
          title: Text("Smartcard - Fiscalização"),
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset("images/logo.png",
                    //width: 50,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                CustomFormInputField(
                  controller: _cpfController,
                  label: "CPF",
                  hint: "Digite seu CPF",
                  obscure: false,
                  type: TextInputType.number,
                  validator: ValidatorsUtil.validateCPF,
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _matController,
                  label: "Matrícula",
                  obscure: false,
                  type: TextInputType.number,
                  validator: ValidatorsUtil.validateNumber,
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _senhaController,
                  label: "Senha",
                  obscure: true,
                  type: TextInputType.text,
                  validator: ValidatorsUtil.validateIsEmpty,
                ),
                SizedBox(
                  height: 36.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {

                      }
                    },
                  ),
                ),
              ],
            ),
          )
        );
  }

  void _onSuccess() {
//    Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => LoginP2Screen()));
  }

  /*void _onMessage(String message) {
    SnackMessages.showSnackBar(context, _scaffoldKey, message);
  }*/

  void _onFail(String error) {
    SnackMessages.showSnackBarError(context, _scaffoldKey, error);
  }
}
