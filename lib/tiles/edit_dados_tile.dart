import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _documentController =
      MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _inscricaoMunicipalController = TextEditingController();
  final _dataNascimentoController =
      MaskedTextController(mask: MaskUtil.dateMask);
  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _phone2Controller = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController =
      MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();
  final _cnhController = TextEditingController();
  final _vencimentoCNHController =
      MaskedTextController(mask: MaskUtil.dateMask);
  final _modalidadeController = TextEditingController();
  String _categoriaCNH;

  final _dateFormat = new DateFormat("dd/MM/yyyy");

  bool _flagCPF = true;
  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _EditInformationTileState(this._scaffoldKey);

  void _controllerMaskCPFCNPJ(String valor) {
    if (valor.length > 14 && _flagCPF) {
      _flagCPF = false;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.cnpjMask, value: valor);
      });
    } else if (valor.length <= 14 && !_flagCPF) {
      _flagCPF = true;
      setState(() {
        _documentController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.cpfMask, value: valor);
      });
    }
  }

  void _controllerMaskCelular(String valor) {
    if (valor.length > 9 && _flagCelular) {
      _flagCelular = false;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.telefone9Mask, value: valor);
      });
    } else if (valor.length <= 9 && !_flagCelular) {
      _flagCelular = true;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(
            mask: MaskUtil.telefone8Mask, value: valor);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _documentController.dispose();
    _rgController.dispose();
    _natController.dispose();
    _nacController.dispose();
    _inscricaoMunicipalController.dispose();
    _dataNascimentoController.dispose();
    _dddController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _celController.dispose();
    _emailController.dispose();
    _cnhController.dispose();
    _vencimentoCNHController.dispose();
    _modalidadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;

      _nomeController.text = usuarioStore.usuario.permissionario.nome;
      _documentController.text = usuarioStore.usuario.permissionario.cpfCnpj;
      _rgController.text = usuarioStore.usuario.permissionario.rg;
      _natController.text = usuarioStore.usuario.permissionario.naturalidade;
      _nacController.text = usuarioStore.usuario.permissionario.nacionalidade;
      _inscricaoMunicipalController.text =
          usuarioStore.usuario.permissionario.inscricaoMunicipal;
      _dataNascimentoController.text =
          usuarioStore.usuario.permissionario.dataNascimento != null
              ? this
                  ._dateFormat
                  .format(usuarioStore.usuario.permissionario.dataNascimento)
              : null;
      _dddController.text = usuarioStore.usuario.permissionario.ddd;
      _phoneController.text = usuarioStore.usuario.permissionario.telefone;
      _phone2Controller.text = usuarioStore.usuario.permissionario.telefone2;
      _celController.text = usuarioStore.usuario.permissionario.celular;
      _emailController.text = usuarioStore.usuario.permissionario.email;
      _cnhController.text = usuarioStore.usuario.permissionario.cnh;
      _categoriaCNH = usuarioStore.usuario.permissionario.categoriaCNH;
      _vencimentoCNHController.text =
          usuarioStore.usuario.permissionario.vencimentoCNH != null
              ? this
                  ._dateFormat
                  .format(usuarioStore.usuario.permissionario.vencimentoCNH)
              : null;
      _modalidadeController.text =
          usuarioStore.usuario.permissionario.modalidade.descricao;
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
                    CustomFormInputField(
                      controller: _nomeController,
                      label: "NOME",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "NOME",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomFormInputField(
                      controller: _emailController,
                      label: "E-MAIL",
                      enabled: false,
                      type: TextInputType.text,
                      hint: "E-MAIL",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
                            controller: _documentController,
                            label: "CPF/CNPJ",
                            type: TextInputType.text,
                            enabled: false,
                            hint: "CPF",
                            onChanged: _controllerMaskCPFCNPJ,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
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
                          child: CustomFormInputField(
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
                          child: CustomFormInputField(
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
                    CustomFormInputField(
                      controller: _inscricaoMunicipalController,
                      label: "INSCRIÇÃO MUNICIPAL",
                      type: TextInputType.number,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "INSCRIÇÃO MUNICIPAL",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomFormInputField(
                      controller: _dataNascimentoController,
                      label: "DATA NASCIMENTO",
                      type: TextInputType.number,
                      validator: ValidatorsUtil.validateDate,
                      hint: "DATA NASCIMENTO",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
                            controller: _dddController,
                            label: "DDD",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateNumber,
                            hint: "DDD",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
                            controller: _phoneController,
                            label: "TELEFONE",
                            type: TextInputType.number,
                            hint: "TELEFONE",
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
                            type: TextInputType.text,
                            hint: "TELEFONE 2",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
                            controller: _celController,
                            label: "CELULAR",
                            type: TextInputType.text,
                            hint: "CELULAR",
                            onChanged: _controllerMaskCelular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomFormInputField(
                      controller: _cnhController,
                      label: "CNH",
                      type: TextInputType.number,
                      validator: ValidatorsUtil.validateNumber,
                      hint: "CNH",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomDropdown(
                            dropdownValues: <String>['A', 'B', 'C', 'D', 'E'],
                            hint: Text("CATEGORIA"),
                            value: this._categoriaCNH,
                            onChanged: (newValue) {
                              setState(() {
                                this._categoriaCNH = newValue;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomFormInputField(
                            controller: _vencimentoCNHController,
                            label: "VENCIMENTO",
                            type: TextInputType.text,
                            hint: "VENCIMENTO",
                            validator: ValidatorsUtil.validateDate,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomFormInputField(
                      controller: _modalidadeController,
                      label: "MODALIDADE",
                      enabled: false,
                      type: TextInputType.text,
                      hint: "MODALIDADE",
                    ),
                    SizedBox(
                      height: 16.0,
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
                                usuarioStore.saveUser(
                                    nome: this._nomeController.text,
                                    cnh: this._cnhController.text,
                                    categoriaCNH: this._categoriaCNH,
                                    celular: Util.clearString(this._celController.text),
                                    dataNascimento: this._dateFormat.parse(
                                        this._dataNascimentoController.text),
                                    ddd: this._dddController.text,
                                    inscricaoMunicipal:
                                    this._inscricaoMunicipalController.text,
                                    nacionalidade: this._nacController.text,
                                    naturalidade: this._natController.text,
                                    rg: this._rgController.text,
                                    telefone: Util.clearString(this._phoneController.text),
                                    telefone2: Util.clearString(this._phone2Controller.text),
                                    vencimentoCNH: this._dateFormat.parse(
                                        this._vencimentoCNHController.text),
                                    context: context,
                                    scaffoldKey: _scaffoldKey);
                              },
                              voidCallbackNao: () {}
                            );
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
