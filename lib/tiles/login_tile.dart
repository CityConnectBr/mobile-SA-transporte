import 'package:cityconnect/screen/recuperacao_senha_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  LoginTile(this._globalKey);

  @override
  _LoginTileState createState() => _LoginTileState(_globalKey);
}

class _LoginTileState extends State<LoginTile> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _LoginTileState(this._scaffoldKey);

  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    return Container(
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
            Text(
              "Seja bem vindo, \nFiscal",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 16.0,
            ),
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
                  SizedBox(
                    height: 16.0,
                  ),
                  CustomInputFieldGrey(
                      controller: _senhaController,
                      label: "Senha",
                      obscure: this._hidePassword,
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: !this._hidePassword
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(
                              () => this._hidePassword = !this._hidePassword);
                        },
                      )),
                  SizedBox(
                    height: 26.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Login",
                      func: () {
                        if (_formKey.currentState.validate()) {
                          usuarioStore.login(
                              email: _emailController.text,
                              senha: _senhaController.text,
                              context: context,
                              scaffoldKey: _scaffoldKey);
                        }
                      }),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Esqueceu a sua senha?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RecuperacaoDeSenhaScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
