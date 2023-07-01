import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PermissionarioEditPasswordTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  PermissionarioEditPasswordTile(this._globalKey);

  @override
  _PermissionarioEditPasswordTileState createState() => _PermissionarioEditPasswordTileState(_globalKey);
}

class _PermissionarioEditPasswordTileState extends State<PermissionarioEditPasswordTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _PermissionarioEditPasswordTileState(this._scaffoldKey);

  final _passwordActualController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  bool _hidePasswordActual = true;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _passwordActualController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);

    return Container(
      child: Observer(builder: (_) {
        if (mainStore.loading)
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
                    CustomInputFieldGrey(
                        controller: _passwordActualController,
                        label: "Senha Atual",
                        obscure: this._hidePasswordActual,
                        type: TextInputType.text,
                        validator: ValidatorsUtil.validatePassword,
                        hint: "Sua senha aqui",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: !this._hidePasswordActual
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._hidePasswordActual =
                                !this._hidePasswordActual);
                          },
                        )),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                        controller: _passwordController,
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
                            setState(
                                () => this._hidePassword = !this._hidePassword);
                          },
                        )),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                        controller: _passwordConfirmController,
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
                    SizedBox(
                      height: 26.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            CustomDialog().showConfirmDialog(
                                context: context,
                                text:
                                    "Tem certeza que\ndeseja alterar sua senha?",
                                voidCallbackSim: () {
                                  mainStore.savePassword(
                                      senhaAtual: Util.clearString(
                                          this._passwordActualController.text),
                                      senha: Util.clearString(
                                          this._passwordController.text),
                                      confirmacao:
                                          this._passwordConfirmController.text,
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
    );
  }
}
