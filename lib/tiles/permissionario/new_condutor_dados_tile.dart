import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewCondutorTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Condutor _condutor;

  NewCondutorTile(this._globalKey, this._condutor);

  @override
  _NewCondutorTileState createState() =>
      _NewCondutorTileState(_globalKey, this._condutor);
}

class _NewCondutorTileState extends State<NewCondutorTile> {
  final _nomeController = TextEditingController();
  TextEditingController _cpfController =
      MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController =
      MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();
  final _cnhController = TextEditingController();
  final _vencimentoCNHController =
      MaskedTextController(mask: MaskUtil.dateMask);
  String _categoriaCNH;
  String _imageCNH;
  final picker = ImagePicker();

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Condutor _condutor;

  _NewCondutorTileState(this._scaffoldKey, this._condutor);

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
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _dddController.dispose();
    _phoneController.dispose();
    _celController.dispose();
    _emailController.dispose();
    _cnhController.dispose();
    _vencimentoCNHController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _nomeController.text = this._condutor.nome;
      _cpfController.text = Util.clearString(this._condutor.cpf);
      _rgController.text = this._condutor.rg;
      _dddController.text = this._condutor.ddd;
      _phoneController.text = this._condutor.telefone;
      _celController.text = this._condutor.celular;
      _emailController.text = this._condutor.email;
      _cnhController.text = this._condutor.cnh;
      _categoriaCNH = this._condutor.categoriaCNH;
      _vencimentoCNHController.text =
      this._condutor.vencimentoCNH != null
          ? this
          ._dateFormat
          .format(this._condutor.vencimentoCNH)
          : null;
    }


    return Container(
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
                          'Dados de contato',
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
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
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
                          child: CustomInputFieldGrey(
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
                    CustomInputFieldGrey(
                      controller: _celController,
                      label: "CELULAR",
                      type: TextInputType.text,
                      hint: "CELULAR",
                      onChanged: _controllerMaskCelular,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
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
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Dados de CNH",
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
                      controller: _cnhController,
                      label: "CNH",
                      type: TextInputType.number,
                      validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
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
                            dropdownValues: const <String>['A', 'AB', 'AC', 'AD', 'AE', 'B', 'C', 'D', 'E'],
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
                          child: CustomInputFieldGrey(
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
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Comprovante de CNH",
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
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: _imageCNH != null ?

                        Image.asset(
                          "${_imageCNH}",
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
                            _imageCNH = pickedFile.path;
                            print(_imageCNH);
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
                                    email: this._emailController.text,
                                    cpf: Util.clearString(this._cpfController.text),
                                    celular: Util.clearString(this._celController.text),
                                    rg: this._rgController.text,
                                    telefone: Util.clearString(this._phoneController.text),
                                    vencimentoCNH: this._dateFormat.parse(
                                        this._vencimentoCNHController.text),
                                    cnh: this._cnhController.text,
                                    categoriaCNH: this._categoriaCNH,
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
