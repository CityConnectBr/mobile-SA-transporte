import 'package:intl/intl.dart';
import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// class VeiculoMultaScreen extends StatefulWidget {
//   final GlobalKey<ScaffoldState> _globalKey;
//   final Veiculo _veiculo;
//
//   VeiculoMultaScreen(this._globalKey, this._veiculo);
//
//   @override
//   _VeiculoMultaScreenState createState() => _VeiculoMultaScreenState(_globalKey, this._veiculo);
// }
//
// class _VeiculoMultaScreenState extends State<VeiculoMultaScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final Veiculo _veiculo;
//
//   _VeiculoMultaScreenState(this._scaffoldKey, this._veiculo);

class VeiculoMultaScreen extends StatefulWidget {

  final Veiculo _veiculo;

  VeiculoMultaScreen(this._veiculo);

  @override
  _VeiculoMultaScreenState createState() =>
      _VeiculoMultaScreenState(this._veiculo);
}

class _VeiculoMultaScreenState extends State<VeiculoMultaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Veiculo _veiculo;

  _VeiculoMultaScreenState(this._veiculo);

  final _nomeController = TextEditingController();
  final _placaController = TextEditingController();
  final _veiculoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _dataController = TextEditingController();
  final _horaController = TextEditingController();
  final _renavamController = TextEditingController();

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  // void _controllerMaskCelular(String valor) {
  //   if (valor.length > 9 && _flagCelular) {
  //     _flagCelular = false;
  //     setState(() {
  //       _celController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone9Mask, value: valor);
  //     });
  //   } else if (valor.length <= 9 && !_flagCelular) {
  //     _flagCelular = true;
  //     setState(() {
  //       _celController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone8Mask, value: valor);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _placaController.dispose();
    _veiculoController.dispose();
    _descricaoController.dispose();
    _dataController.dispose();
    _horaController.dispose();
    _renavamController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //CondutorStore condutorStore = Provider.of<CondutorStore>(context);
    VeiculoStore veiculoStore = Provider.of<VeiculoStore>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Multar Veículo",
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
              if (veiculoStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              //Setando dados carregados após loader
              if (!this._flagIsLoad) {
                this._flagIsLoad = true;
                // if (condutorStore.solicitacaoExistente) {
                //   _emailController.text = condutorStore.solicitacaoDeAlteracao.campo1;
                //   _dddController.text = condutorStore.solicitacaoDeAlteracao.campo2;
                //   _phoneController.text = condutorStore.solicitacaoDeAlteracao.campo3;
                //   _celController.text = condutorStore.solicitacaoDeAlteracao.campo4;
                // } else
                  {
                  // _emailController.text = condutorStore.condutor.email;
                  // _dddController.text = condutorStore.condutor.ddd;
                  // _phoneController.text = condutorStore.condutor.telefone;
                  // _celController.text = condutorStore.condutor.celular;
                  _nomeController.text = this._veiculo.permissionario?.nome;
                  _placaController.text = this._veiculo?.placa;
                  _veiculoController.text = this._veiculo.id.toString();//this._veiculo?.marcaModeloCarroceria?.modelo;
                  _descricaoController.text = null;
                  _renavamController.text = this._veiculo?.renavam;
                  _dataController.text = DateFormat('dd/MM/yyyy').format(DateTime.now())??null;
                  _horaController.text = DateFormat('hh:mm').format(DateTime.now())??null;
                }
              }

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Dados da Multa",
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
                            label: "Permissionário",
                            type: TextInputType.text,
                            hint: "PERMISSIONÁRIO",
                            enabled: false,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _renavamController,
                            label: "Renavam",
                            type: TextInputType.text,
                            hint: "Renavam",
                            enabled: false,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _placaController,
                                  label: "Placa",
                                  type: TextInputType.text,
                                  //validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                                  hint: "Placa",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _veiculoController,
                                  label: "Veículo",
                                  type: TextInputType.text,
                                  hint: "Veículo",
                                  enabled: false,
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
                                  controller: _dataController,
                                  label: "Data",
                                  type: TextInputType.text,
                                  //validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                                  hint: "Data",
                                  enabled: true,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _horaController,
                                  label: "Hora",
                                  type: TextInputType.text,
                                  hint: "Hora",
                                  enabled: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _descricaoController,
                            label: "Descrição",
                            type: TextInputType.text,
                            hint: "Descrição",
                            maxLines: 3,
                            alignLabelWithHint: true,
                            //onChanged: _controllerMaskCelular,
                          ),

                          SizedBox(
                            height: 30.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Gerar Multa",
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja gerar esta multa?",
                                      voidCallbackSim: () {
                                        veiculoStore.saveSolicitacaoMulta(
                                            nome: this._nomeController.text,
                                            renavam: this._renavamController.text,
                                            placa: this._placaController.text,
                                            descricao: Util.clearString(this._descricaoController.text),
                                            veiculo_nome: this._veiculoController.text,
                                            data: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                            hora: this._horaController.text,
                                            veiculo_id: this._veiculo.id.toString(),
                                            veiculo: this._veiculo,
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
