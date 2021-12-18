import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_autocomplete.dart';
import 'package:sa_transportes_mobile/widgets/custom_dropdown.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VeiculoDadosScreen extends StatefulWidget {
  VeiculoDadosScreen();

  @override
  _VeiculoDadosScreenState createState() => _VeiculoDadosScreenState();
}

class _VeiculoDadosScreenState extends State<VeiculoDadosScreen> {
  final _placaController = TextEditingController();
  final _renavanController = TextEditingController();
  final _chassiController = TextEditingController();
  final _anoDeFabricacaoController = TextEditingController();
  final _anoDoModeloController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _tipoVeiculoController = TextEditingController();
  final _observacaoDaCapacidadeController = TextEditingController();
  final _anosDeVidaUtilDoVeiculoController = TextEditingController();
  final _marcaModeloVeiculoController = TextEditingController();
  final _tipoCombustivelController = TextEditingController();
  final _corController = TextEditingController();

  String idMarcaModeloSelectd;
  String idTipoCombustivelSelectd;
  String idCorSelectd;
  String idTipoSelectd;

  String _tipoDaCapacidade;
  String _image;

  bool _flagIsLoad = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _placaController.dispose();
    _renavanController.dispose();
    _chassiController.dispose();
    _anoDeFabricacaoController.dispose();
    _anoDoModeloController.dispose();
    _capacidadeController.dispose();
    _tipoVeiculoController.dispose();
    _observacaoDaCapacidadeController.dispose();
    _anosDeVidaUtilDoVeiculoController.dispose();
    _marcaModeloVeiculoController.dispose();
    _tipoCombustivelController.dispose();
    _corController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    //para resolver bug do InputAutocomplete atualizar o contexto ao ser selecionado
    _veiculoStore.loading=false;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados Veículo",
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
              if (_veiculoStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              //Setando dados carregados após loader
              if (!this._flagIsLoad) {
                this._flagIsLoad = true;
                if (_veiculoStore.solicitacaoExistente) {
                  _placaController.text = _veiculoStore.solicitacaoDeAlteracao.campo1;
                  _renavanController.text = _veiculoStore.solicitacaoDeAlteracao.campo2;
                  idMarcaModeloSelectd = _veiculoStore.solicitacaoDeAlteracao.campo3;
                  _chassiController.text = _veiculoStore.solicitacaoDeAlteracao.campo4;
                  idTipoCombustivelSelectd = _veiculoStore.solicitacaoDeAlteracao.campo5;
                  _anoDeFabricacaoController.text = _veiculoStore.solicitacaoDeAlteracao.campo6;
                  _anoDoModeloController.text = _veiculoStore.solicitacaoDeAlteracao.campo7;
                  idCorSelectd = _veiculoStore.solicitacaoDeAlteracao.campo8;
                  idTipoSelectd = _veiculoStore.solicitacaoDeAlteracao.campo9;
                  _tipoDaCapacidade = _veiculoStore.solicitacaoDeAlteracao.campo10;
                  _capacidadeController.text = _veiculoStore.solicitacaoDeAlteracao.campo11;
                  _observacaoDaCapacidadeController.text = _veiculoStore.solicitacaoDeAlteracao.campo12;
                  _anosDeVidaUtilDoVeiculoController.text = _veiculoStore.solicitacaoDeAlteracao.campo13;
                } else {
                  _placaController.text = _veiculoStore.veiculo.placa;
                  _renavanController.text = _veiculoStore.veiculo.renavam;
                  idMarcaModeloSelectd = Util.toStringIfIsNotNull(_veiculoStore.veiculo.marcaModeloVeiculoId);
                  _chassiController.text = _veiculoStore.veiculo.chassi;
                  idTipoCombustivelSelectd = Util.toStringIfIsNotNull(_veiculoStore.veiculo.tipoCombustivelId);
                  _anoDeFabricacaoController.text = Util.toStringIfIsNotNull(_veiculoStore.veiculo.anoDeFabricacao);
                  _anoDoModeloController.text = Util.toStringIfIsNotNull(_veiculoStore.veiculo.anoDoModelo);
                  idCorSelectd = Util.toStringIfIsNotNull(_veiculoStore.veiculo.corId);
                  idTipoSelectd = Util.toStringIfIsNotNull(_veiculoStore.veiculo.tipoVeiculoId);
                  _tipoDaCapacidade = _veiculoStore.veiculo.tipoDaCapacidade;
                  _capacidadeController.text = _veiculoStore.veiculo.capacidade;
                  _observacaoDaCapacidadeController.text = _veiculoStore.veiculo.observacaoDaCapacidade;
                  _anosDeVidaUtilDoVeiculoController.text = Util.toStringIfIsNotNull(_veiculoStore.veiculo.anosDeVidaUtilDoVeiculo);
                }

                //setando itens do autocomplete
                if(idMarcaModeloSelectd!=null && idMarcaModeloSelectd.isNotEmpty) {
                 print('idmarcamodeloselected'); print(idMarcaModeloSelectd);
                  _veiculoStore
                      .findMarcaModeloById(idMarcaModeloSelectd)
                      .then((value) =>
                  {
                    if(value != null){
                      _marcaModeloVeiculoController.text = value.descricao
                    }
                  });
                }

                if(idTipoCombustivelSelectd!=null && idTipoCombustivelSelectd.isNotEmpty) {
                  _veiculoStore
                      .findTipoCombustivelById(idTipoCombustivelSelectd)
                      .then((value) =>
                  {
                    if(value != null){
                      _tipoCombustivelController.text = value.descricao
                    }
                  });
                }

                if(idCorSelectd!=null && idCorSelectd.isNotEmpty) {
                  _veiculoStore
                      .findCorVeiculoById(idCorSelectd)
                      .then((value) =>
                  {
                    if(value != null){
                      _corController.text = value.descricao
                    }
                  });
                }

                if(idTipoSelectd!=null && idTipoSelectd.isNotEmpty) {
                  _veiculoStore
                      .findTipoVeiculoById(idTipoSelectd)
                      .then((value) =>
                  {
                    if(value != null){
                      _tipoVeiculoController.text = value.descricao
                    }
                  });
                }


              }



              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _veiculoStore.solicitacaoExistente
                        ? CustomAlertMessage(
                            type: CustomAlertMessage.WANNING,
                            message: "Já existe uma solicitação em andanmento! Uma nova alteração irá cancelar a solicitação anterior.",
                          )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          CustomInputFieldGrey(
                            controller: _placaController,
                            label: "PLACA",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.placaVeiculo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InputAutocomplete(
                              controller: _marcaModeloVeiculoController,
                              label: "MARCA/MODELO",
                              searchCallback: _veiculoStore.searchMarcaModelo,
                              setSelected: (s) => idMarcaModeloSelectd = s.id,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _renavanController,
                            label: "RENAVAN",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.caracteres11,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _chassiController,
                            label: "CHASSI",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.isNullOrIsEmpty,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InputAutocomplete(
                              controller: _tipoCombustivelController,
                              label: "TIPO DE COMBUSTIVEL",
                              searchCallback: _veiculoStore.searchTipoCombustivel,
                              setSelected: (s) => idMarcaModeloSelectd = s.id,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _anoDeFabricacaoController,
                                  label: "ANO DE FABRICACAO",
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _anoDoModeloController,
                                  label: "ANO DO MODELO",
                                  obscure: false,
                                  type: TextInputType.number,
                                  validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InputAutocomplete(
                              controller: _corController,
                              label: "COR",
                              searchCallback: _veiculoStore.searchCorVeiculo,
                              setSelected: (s) => idCorSelectd = s.id,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InputAutocomplete(
                              controller: _tipoVeiculoController,
                              label: "TIPO DO VEICULO",
                              searchCallback: _veiculoStore.searchTipoVeiculo,
                              setSelected: (s) => idTipoSelectd = s.id,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _capacidadeController,
                                  label: "CAPACIDADE",
                                  obscure: false,
                                  type: TextInputType.text,
                                  validator: ValidatorsUtil.isNullOrIsEmpty,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomDropdown(
                                  dropdownValues: const <String>['Normal', 'Homologada', 'Modificada'],
                                  hint: Text(
                                    "TIPO:",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  value: _findCapacidadeSelecionada(this._tipoDaCapacidade),
                                  onChanged: (newValue) {
                                    setState(() {
                                      this._tipoDaCapacidade = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _observacaoDaCapacidadeController,
                            label: "OBSERVAÇÃO DA CAPACIDADE",
                            obscure: false,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _anosDeVidaUtilDoVeiculoController,
                            label: "ANOS DE VIDA",
                            obscure: false,
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomImagePickerField(
                            imagePath: this._image,
                            text: "Documento do Veículo",
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
                                _veiculoStore.saveVeiculo(
                                    anoDeFabricacao: int.parse(_anoDeFabricacaoController.text),
                                    anoDoModelo: int.parse(_anoDoModeloController.text),
                                    anosDeVidaUtilDoVeiculo: int.parse(_anosDeVidaUtilDoVeiculoController.text),
                                    capacidade: _capacidadeController.text,
                                    chassi: _chassiController.text,
                                    corId: int.parse(idCorSelectd),
                                    documentoFoto: _image,
                                    marcaModeloVeiculoId: int.parse(idMarcaModeloSelectd),
                                    observacaoDaCapacidade: _observacaoDaCapacidadeController.text,
                                    placa: _placaController.text,
                                    renavam: _renavanController.text,
                                    tipoCombustivelId: int.parse(idCorSelectd),
                                    tipoDaCapacidade: _tipoDaCapacidade,
                                    tipoVeiculoId: int.parse(idTipoSelectd),
                                    context: context,
                                    scaffoldKey: _scaffoldKey);
                              }
                            },
                          ),
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

  String _findCapacidadeSelecionada(String tipo) {
    const map = {'N': 'Normal', 'H': 'Homologada', 'M': 'Modificada'};

    if (tipo != null) {
      return map[tipo];
    }
    return null;
  }
}
