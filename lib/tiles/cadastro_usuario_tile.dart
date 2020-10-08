import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CadastroUsuarioTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  CadastroUsuarioTile(this._globalKey);

  @override
  _CadastroUsuarioTileState createState() =>
      _CadastroUsuarioTileState(this._globalKey);
}

class _CadastroUsuarioTileState extends State<CadastroUsuarioTile> {
  final GlobalKey<ScaffoldState> _globalKey;

  _CadastroUsuarioTileState(this._globalKey);

  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  TextEditingController _documentController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _cnhController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmacaoController = TextEditingController();

  ////////// FLAGS
  bool _termoAceito = false;
  bool flagCPF = true;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  //////////////////

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _emailController.dispose();
    _documentController.dispose();
    _documentController.text = "";
    _cnhController.dispose();
    _senhaController.dispose();
    _senhaConfirmacaoController.dispose();
  }

  void _controllerMaskCPFCNPJ(String valor) {
    if (valor.length > 14 && flagCPF) {
      flagCPF = false;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.cnpjMask, value: valor);
      });
    } else if (valor.length <= 14 && !flagCPF) {
      flagCPF = true;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.cpfMask, value: valor);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Novo por aqui?",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Form(
              key: this._formKey,
              child: Column(
                children: <Widget>[
                  CustomInputFieldGrey(
                    controller: _nomeController,
                    label: "Nome",
                    type: TextInputType.text,
                    validator: ValidatorsUtil.validateIsEmpty,
                    hint: "Seu nome",
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
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
                      controller: _documentController,
                      label: "CPF/CNPJ",
                      obscure: false,
                      type: TextInputType.number,
                      validator: ValidatorsUtil.validateCPFCNPJ,
                      hint: "Seu documento aqui",
                      onChanged: _controllerMaskCPFCNPJ),
                  SizedBox(
                    height: 16.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _cnhController,
                    label: "CNH",
                    obscure: false,
                    type: TextInputType.number,
                    hint: "Seu documento CNH aqui",
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
                      )
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  CustomInputFieldGrey(
                      controller: _senhaConfirmacaoController,
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
                      )
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: this._termoAceito,
                        onChanged: _checkBoxChange,
                        checkColor: Theme.of(context).primaryColor,
                      ),
                      Text("Aceito termos de uso")
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Ler termo de uso",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        )),
                    onTap: () {
                      print(launch(
                          "http://api.santo-andre-transporte.cityconnect.com.br/"));
                    },
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Cadastro",
                      func: () {
                        if (_formKey.currentState.validate()) {
                          usuarioStore.signin(
                              email: _emailController.text,
                              senha: _senhaController.text,
                              cpfCnpj: Util.clearString(_documentController.text),
                              cnh: _cnhController.text,
                              confirmacaoDeSenha:
                                  _senhaConfirmacaoController.text,
                              nome: _nomeController.text,
                              contratoAceito: _termoAceito,
                              context: context,
                              scaffoldKey: _globalKey);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkBoxChange(bool novoValor) {
    setState(() {
      this._termoAceito = novoValor;
    });
  }
}
