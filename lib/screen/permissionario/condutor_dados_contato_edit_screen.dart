import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorDadosContatoScreen extends StatefulWidget {
  final Condutor _condutor;

  CondutorDadosContatoScreen(this._condutor);

  @override
  _CondutorDadosContatoScreenState createState() =>
      _CondutorDadosContatoScreenState(this._condutor);
}

class _CondutorDadosContatoScreenState extends State<CondutorDadosContatoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Condutor _condutor;

  _CondutorDadosContatoScreenState(this._condutor);

  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController =
  MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();

  bool _flagCelular = true;
  bool _flagIsLoad = false;

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

    _dddController.dispose();
    _phoneController.dispose();
    _celController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _emailController.text = this._condutor.email;
      _dddController.text = this._condutor.ddd;
      _phoneController.text = this._condutor.telefone;
      _celController.text = this._condutor.celular;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados Contato",
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
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
                                "Dados de contato",
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
//                                        condutorStore.save(
//                                            email: this._emailController.text,
//                                            celular: Util.clearString(this._celController.text),
//                                            ddd: this._dddController.text,
//                                            telefone: Util.clearString(this._phoneController.text),
//                                            context: context,
//                                            scaffoldKey: _scaffoldKey);
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
          ),
        ],
      ),
    );
  }
}
