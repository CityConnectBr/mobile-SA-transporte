import 'package:cityconnect/models/veiculo_model.dart';
import 'package:cityconnect/screen/permissionario/veiculo_dados_screen.dart';
import 'package:cityconnect/stores/permissionario/veiculo_store.dart';
import 'package:cityconnect/tiles/card_edit_fields_tile.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeiculoEditScreen extends StatefulWidget {
  final Veiculo _veiculo;

  VeiculoEditScreen(this._veiculo);

  @override
  _VeiculoEditScreenState createState() => _VeiculoEditScreenState(this._veiculo);
}

class _VeiculoEditScreenState extends State<VeiculoEditScreen> with SingleTickerProviderStateMixin {

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

  final Veiculo _veiculo;

  _VeiculoEditScreenState(this._veiculo);

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

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _placaController.text = this._veiculo.placa;
      _renavanController.text = this._veiculo.renavam;
      _chassiController.text = this._veiculo.chassi;
      _anoDeFabricacaoController.text = this._veiculo.anoDeFabricacao!=null?this._veiculo.anoDeFabricacao.toString():"";
      _anoDoModeloController.text = this._veiculo.anoDoModelo!=null?this._veiculo.anoDoModelo.toString():"";
      _capacidadeController.text = this._veiculo.capacidade;
      _tipoDaCapacidadeController.text = this._veiculo.tipoDaCapacidade;
      _observacaoDaCapacidadeController.text = this._veiculo.observacaoDaCapacidade;
      _anosDeVidaUtilDoVeiculoController.text = this._veiculo.anosDeVidaUtilDoVeiculo!=null?this._veiculo.anosDeVidaUtilDoVeiculo.toString():"";
      _marcaModeloVeiculoController.text = this._veiculo.marcaModeloVeiculo!=null?this._veiculo.marcaModeloVeiculo.descricao:"";
      _tipoCombustivelController.text = this._veiculo.tipoCombustivel!=null?this._veiculo.tipoCombustivel.descricao:"";
      _corController.text = this._veiculo.corVeiculo!=null?this._veiculo.corVeiculo.descricao:"";
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
            child: CardEditFieldsTile(
              title: 'Dados do Veículo',
              voidCallback: () {
                _veiculoStore.editVeiculo(
                    context: context,
                    scaffoldKey: _scaffoldKey,
                    screenToOpen: VeiculoDadosScreen());
              },
              child: Column(
                children: <Widget>[
                  CustomInputFieldGrey(
                    controller: _placaController,
                    label: "PLACA",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _renavanController,
                    label: "RENAVAN",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _chassiController,
                    label: "CHASSI",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDeFabricacaoController,
                    label: "ANO DE FABRICACAO",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDoModeloController,
                    label: "ANO DO MODELO",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _capacidadeController,
                    label: "CAPACIDADE",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoDaCapacidadeController,
                    label: "TIPO DA CAPACIDADE:",
                    obscure: false,
                    type: TextInputType.text,
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
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _marcaModeloVeiculoController,
                    label: "MARCA MODELO",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoCombustivelController,
                    label: "TIPO DE COMBUSTIVEL",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _corController,
                    label: "COR",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
