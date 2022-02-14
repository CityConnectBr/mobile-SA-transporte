import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/veiculo_dados_screen.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeiculoShowScreen extends StatefulWidget {
  // final Veiculo _veiculo;

  VeiculoShowScreen();

  @override
  _VeiculoShowScreenState createState() => _VeiculoShowScreenState();
}

class _VeiculoShowScreenState extends State<VeiculoShowScreen>
    with SingleTickerProviderStateMixin {

  final _placaController = TextEditingController();
  final _renavanController = TextEditingController();
  final _chassiController = TextEditingController();
  final _anoDeFabricacaoController = TextEditingController();
  final _anoDoModeloController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _tipoDaCapacidadeController = TextEditingController();
  final _observacaoDaCapacidadeController = TextEditingController();
  final _anosDeVidaUtilDoVeiculoController = TextEditingController();
  final _marcaModeloVeiculoController = TextEditingController();
  final _tipoCombustivelController = TextEditingController();
  final _corController = TextEditingController();

  // final Veiculo _veiculo;

  _VeiculoShowScreenState();

  bool _flagIsLoad = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();

    _placaController.dispose();
    _renavanController.dispose();
    _chassiController.dispose();
    _anoDeFabricacaoController.dispose();
    _anoDoModeloController.dispose();
    _capacidadeController.dispose();
    _tipoDaCapacidadeController.dispose();
    _observacaoDaCapacidadeController.dispose();
    _anosDeVidaUtilDoVeiculoController.dispose();
    _marcaModeloVeiculoController.dispose();
    _tipoCombustivelController.dispose();
    _corController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);
    _veiculoStore.firstLoadList(context: context, scaffoldKey: _scaffoldKey);
    //_veiculo = _veiculoStore.veiculo;

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;

      if (_veiculoStore.veiculos != null && _veiculoStore.veiculos.isNotEmpty) {
        final veiculo = _veiculoStore.veiculos.first;

        _placaController.text = veiculo?.placa;
        _renavanController.text = veiculo.renavam;
        _chassiController.text = veiculo.chassi;
        _anoDeFabricacaoController.text = veiculo.anoDeFabricacao != null
            ? veiculo.anoDeFabricacao.toString()
            : "";
        _anoDoModeloController.text =
        veiculo.anoDoModelo != null ? veiculo.anoDoModelo.toString() : "";
        _capacidadeController.text = veiculo.capacidade;
        _tipoDaCapacidadeController.text = veiculo.tipoDaCapacidade;
        _observacaoDaCapacidadeController.text = veiculo.observacaoDaCapacidade;
        _anosDeVidaUtilDoVeiculoController.text =
        veiculo.anosDeVidaUtilDoVeiculo != null ? veiculo
            .anosDeVidaUtilDoVeiculo.toString() : "";
        _marcaModeloVeiculoController.text =
        veiculo.marcaModeloVeiculo != null ? veiculo.marcaModeloVeiculo
            .descricao : "";
        _tipoCombustivelController.text = veiculo.tipoCombustivel != null
            ? veiculo.tipoCombustivel.descricao
            : "";
        _corController.text =
        veiculo.corVeiculo != null ? veiculo.corVeiculo.descricao : "";
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Veículo',),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Observer(builder: (_) {
                if (_veiculoStore.loading) {
                  return Container(
                    margin: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Container(
                  child: Column(
                  children: [
                  CustomInputFieldGrey(
                    controller: _placaController,
                    label: "PLACA",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _renavanController,
                    label: "RENAVAN",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _chassiController,
                    label: "CHASSI",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDeFabricacaoController,
                    label: "ANO DE FABRICACAO",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDoModeloController,
                    label: "ANO DO MODELO",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _capacidadeController,
                    label: "CAPACIDADE",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoDaCapacidadeController,
                    label: "TIPO DA CAPACIDADE:",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _observacaoDaCapacidadeController,
                    label: "OBSERVAÇÃO DA CAPACIDADE",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anosDeVidaUtilDoVeiculoController,
                    label: "ANOS DE VIDA",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _marcaModeloVeiculoController,
                    label: "MARCA MODELO",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoCombustivelController,
                    label: "TIPO DE COMBUSTIVEL",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _corController,
                    label: "COR",
                    obscure: false,
                    enabled: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ],)
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
