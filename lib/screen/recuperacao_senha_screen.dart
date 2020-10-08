import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RecuperacaoDeSenhaScreen extends StatefulWidget {
  @override
  _RecuperacaoDeSenhaScreenState createState() =>
      _RecuperacaoDeSenhaScreenState();
}

class _RecuperacaoDeSenhaScreenState extends State<RecuperacaoDeSenhaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaoDeSenhaController = TextEditingController();

  ////////// FLAGS
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  //////////////////

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _codeController.dispose();
    _senhaController.dispose();
    _confirmacaoDeSenhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Recueração de Senha"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Observer(builder: (_) {
          if (usuarioStore.loading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomInputFieldGrey(
                      controller: _emailController,
                      label: "E-mail",
                      obscure: false,
                      type: TextInputType.emailAddress,
                      validator: ValidatorsUtil.validateEmail,
                      hint: "Seu endereço de e-mail aqui",
                    ),
                    usuarioStore.showRecoverCodeField
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 26.0,
                              ),
                              Text(
                                "Digite abaixo o código recebido via e-mail",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomInputFieldGrey(
                                controller: _codeController,
                                label: "Código",
                                obscure: false,
                                type: TextInputType.number,
                                validator: ValidatorsUtil.validateIsEmpty,
                              )
                            ],
                          )
                        : Container(),
                    usuarioStore.showRecoverPasswordField
                        ? Column(
                            children: <Widget>[
                              SizedBox(
                                height: 16.0,
                              ),
                              CustomInputFieldGrey(
                                  controller: _senhaController,
                                  label: "Senha",
                                  obscure: this._hidePassword,
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validatePassword,
                                  hint: "Sua senha aqui",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: !this._hidePassword
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() => this._hidePassword =
                                          !this._hidePassword);
                                    },
                                  )),
                              SizedBox(
                                height: 16.0,
                              ),
                              CustomInputFieldGrey(
                                  controller: _confirmacaoDeSenhaController,
                                  label: "Confirmação de senha",
                                  obscure: this._hideConfirmPassword,
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.validateIsEmpty,
                                  hint: "Repita a sua senha",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: !this._hideConfirmPassword
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() => this._hideConfirmPassword =
                                          !this._hideConfirmPassword);
                                    },
                                  )),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 26.0,
                    ),
                    !usuarioStore.showRecoverCodeField
                        ? CustomRaisedButtonBlue(
                            label: "Enviar",
                            func: () {
                              if (_formKey.currentState.validate()) {
                                usuarioStore.initPasswordRecovery(
                                    email: _emailController.text,
                                    context: context,
                                    scaffoldKey: _scaffoldKey);
                              }
                            })
                        : Container(),
                    usuarioStore.showRecoverCodeField && !usuarioStore.showRecoverPasswordField
                        ? CustomRaisedButtonBlue(
                        label: "Validar Código",
                        func: () {
                          if (_formKey.currentState.validate()) {
                            usuarioStore.validateRecoveryCode(
                                email: _emailController.text,
                                code: _codeController.text,
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        })
                        : Container(),
                    usuarioStore.showRecoverCodeField && usuarioStore.showRecoverPasswordField
                        ? CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState.validate()) {
                            usuarioStore.recoveryPassword(
                                email: _emailController.text,
                                code: _codeController.text,
                                senha: _senhaController.text,
                                confirmacaoDeSenha: _confirmacaoDeSenhaController.text,
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        })
                        : Container(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
