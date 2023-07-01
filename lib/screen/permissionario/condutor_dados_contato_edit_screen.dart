import 'package:brasil_fields/brasil_fields.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorDadosContatoScreen extends StatefulWidget {
  CondutorDadosContatoScreen();

  @override
  _CondutorDadosContatoScreenState createState() =>
      _CondutorDadosContatoScreenState();
}

class _CondutorDadosContatoScreenState
    extends State<CondutorDadosContatoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _dddController = TextEditingController();
  final _phoneController = TextEditingController();
  final _celController = TextEditingController();
  final _emailController = TextEditingController();

  bool _flagCelular = true;
  bool _flagIsLoad = false;

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

              //Setando dados carregados após loader
              if (!_flagIsLoad) {
                _flagIsLoad = true;
                if (condutorStore.solicitacaoExistente) {
                  _emailController.text =
                      condutorStore.solicitacaoDeAlteracao?.campo1 ?? '';
                  _dddController.text =
                      condutorStore.solicitacaoDeAlteracao?.campo2 ?? '';
                  _phoneController.text =
                      condutorStore.solicitacaoDeAlteracao?.campo3 ?? '';
                  _celController.text =
                      condutorStore.solicitacaoDeAlteracao?.campo4 ?? '';
                } else {
                  _emailController.text = condutorStore.condutor?.email ?? '';
                  _dddController.text = condutorStore.condutor?.ddd ?? '';
                  _phoneController.text = condutorStore.condutor?.telefone ?? '';
                  _celController.text = condutorStore.condutor?.celular ?? '';
                }
              }

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    condutorStore.solicitacaoExistente
                        ? CustomAlertMessage(
                            type: CustomAlertMessage.WANNING,
                            message:
                                "Já existe uma solicitação em andanmento! Uma nova alteração irá cancelar a solicitação anterior.",
                          )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
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
                                  validator: ValidatorsUtil
                                      .validateNumberAndNotIsEmpty,
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
                                  inputFormatters: [
                                    TelefoneInputFormatter(),
                                  ],
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
                            inputFormatters: [
                              TelefoneInputFormatter(),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Salvar",
                              func: () {
                                if (_formKey.currentState!.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        condutorStore.saveContatoCondutor(
                                            email: _emailController.text,
                                            celular: Util.clearString(
                                                _celController.text),
                                            ddd: _dddController.text,
                                            telefone: Util.clearString(
                                                _phoneController.text),
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
          ),
        ],
      ),
    );
  }
}
