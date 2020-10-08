import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EditAddressTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  EditAddressTile(this._globalKey);

  @override
  _EditAddressTileState createState() => _EditAddressTileState(_globalKey);
}

class _EditAddressTileState extends State<EditAddressTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _EditAddressTileState(this._scaffoldKey);

  final _cepController = MaskedTextController(mask: MaskUtil.cepMask);
  final _addressController = TextEditingController();
  final _numController = TextEditingController();
  final _complementController = TextEditingController();
  final _bairroController = TextEditingController();
  final _municipioController = TextEditingController();
  String _uf;

  @override
  void initState() {
    super.initState();
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    super.dispose();

    _cepController.dispose();
    _addressController.dispose();
    _numController.dispose();
    _complementController.dispose();
    _bairroController.dispose();
    _municipioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;

      _cepController.text = usuarioStore.usuario.permissionario.endereco.cep;
      _addressController.text =
          usuarioStore.usuario.permissionario.endereco.endereco;
      _numController.text = usuarioStore.usuario.permissionario.endereco.numero;
      _complementController.text =
          usuarioStore.usuario.permissionario.endereco.complemento;
      _bairroController.text =
          usuarioStore.usuario.permissionario.endereco.bairro;
      _municipioController.text =
          usuarioStore.usuario.permissionario.endereco.municipio;
      _uf = usuarioStore.usuario.permissionario.endereco.uf;
    }

    return Container(
      child: Observer(builder: (_) {
        if (usuarioStore.loading)
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _cepController,
                            label: "CEP",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateCEP,
                            hint: "CEP",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _addressController,
                            label: "ENDEREÇO",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "ENDEREÇO",
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
                            controller: _numController,
                            label: "NÚMERO",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateNumber,
                            hint: "NÚMERO",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _complementController,
                            label: "COMPLEMENTO",
                            type: TextInputType.text,
                            hint: "COMPLEMENTO",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _bairroController,
                      label: "BAIRRO",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "BAIRRO",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _municipioController,
                            label: "MUNICÍPIO",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "MUNICÍPIO",
                          ),
                        ),
                        Spacer(),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: CustomDropdown(
                              dropdownValues: Util.UFs,
                              hint: Text("UF"),
                              value: this._uf,
                              onChanged: (newValue) {
                                setState(() {
                                  this._uf = newValue;
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState.validate()) {
                            CustomDialog().showConfirmDialog(
                                context: context,
                                text: "Tem certeza que\ndeseja salvar?",
                                voidCallbackSim: () {
                                  usuarioStore.saveEndereco(
                                      cep: Util.clearString(
                                          this._cepController.text),
                                      endereco: this._addressController.text,
                                      complemento:
                                          this._complementController.text,
                                      bairro: this._bairroController.text,
                                      numero: this._numController.text,
                                      municipio: this._municipioController.text,
                                      uf: this._uf,
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
