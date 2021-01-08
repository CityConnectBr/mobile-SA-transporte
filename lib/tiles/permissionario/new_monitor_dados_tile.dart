import 'package:cityconnect/stores/permissionario/monitor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_image_picker_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewMonitorTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  NewMonitorTile(this._globalKey);

  @override
  _NewMonitorTileState createState() => _NewMonitorTileState(_globalKey);
}

class _NewMonitorTileState extends State<NewMonitorTile> {
  final _nomeController = TextEditingController();
  TextEditingController _cpfController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  TextEditingController _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();
  final _dataNascController = MaskedTextController(mask: MaskUtil.dateMask);
  String _image;

  bool _flagIsLoad = false;
  bool _flagCelular = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _NewMonitorTileState(this._scaffoldKey);

  void _controllerMaskCelular(String valor) {
    if (valor.length > 9 && _flagCelular) {
      _flagCelular = false;
      setState(() {
        _phoneController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone9Mask, value: valor);
      });
    } else if (valor.length <= 9 && !_flagCelular) {
      _flagCelular = true;
      setState(() {
        _phoneController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone8Mask, value: valor);
      });
    }
  }

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
    _phoneController.dispose();
    _emailController.dispose();
    _dataNascController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _nomeController.text = monitorStore.solicitacaoDeAlteracao.campo10;
      _cpfController.text = Util.clearString(monitorStore.solicitacaoDeAlteracao.campo11);
      _rgController.text = monitorStore.solicitacaoDeAlteracao.campo12;
      _phoneController.text = monitorStore.solicitacaoDeAlteracao.campo2;
      _emailController.text = monitorStore.solicitacaoDeAlteracao.campo1;
      _dataNascController.text =
          monitorStore.solicitacaoDeAlteracao.campo13 != null ? Util.convertyyyyMMddToddMMyyyy(monitorStore.solicitacaoDeAlteracao.campo13) : null;
      _image = monitorStore.solicitacaoDeAlteracao.arquivo1;
    }

    return Container(
      child: Observer(builder: (_) {
        if (monitorStore.loading)
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
                          'Dados de Contato',
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
                      controller: _emailController,
                      label: "E-MAIL",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateEmail,
                      hint: "E-MAIL",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _phoneController,
                      label: "TELEFONE",
                      type: TextInputType.number,
                      hint: "TELEFONE",
                      onChanged: _controllerMaskCelular,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Dados de Identidade",
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
                    CustomInputFieldGrey(
                      controller: _dataNascController,
                      label: "DATA NASC.",
                      type: TextInputType.number,
                      hint: "DATA NASCIMENTO",
                      validator: ValidatorsUtil.validateDate,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._image,
                      text: "Comprovante de Identidade",
                      callBack: (String imgPath) {
                        this._image = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState.validate()) {
                            monitorStore.saveAbaDadosNewMonitor(
                                nome: this._nomeController.text,
                                email: this._emailController.text,
                                cpf: Util.clearString(this._cpfController.text),
                                rg: this._rgController.text,
                                telefone: Util.clearString(this._phoneController.text),
                                dataNasc: Util.dateFormatddMMyyyy.parse(this._dataNascController.text),
                                imgComprovante: this._image,
                                context: context,
                                scaffoldKey: _scaffoldKey);
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
