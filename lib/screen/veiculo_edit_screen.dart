import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/fiscal/emissao_multa_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/veiculo_dados_screen.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';

class VeiculoEditScreen extends StatefulWidget {
  final Veiculo _veiculo;

  VeiculoEditScreen(this._veiculo);

  @override
  _VeiculoEditScreenState createState() => _VeiculoEditScreenState(_veiculo);
}

class _VeiculoEditScreenState extends State<VeiculoEditScreen>
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

  final Veiculo _veiculo;

  _VeiculoEditScreenState(this._veiculo);

  bool _flagIsLoad = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
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
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;
      _placaController.text = _veiculo.placa ?? '';
      _renavanController.text = _veiculo.renavam ?? '';
      _chassiController.text = _veiculo.chassi ?? '';
      _anoDeFabricacaoController.text = _veiculo.anoDeFabricacao != null
          ? _veiculo.anoDeFabricacao.toString()
          : "";
      _anoDoModeloController.text =
          _veiculo.anoDoModelo != null ? _veiculo.anoDoModelo.toString() : "";
      _capacidadeController.text = _veiculo.capacidade ?? '';
      _tipoDaCapacidadeController.text = _veiculo.tipoDaCapacidade ?? '';
      _observacaoDaCapacidadeController.text =
          _veiculo.observacaoDaCapacidade ?? '';
      _anosDeVidaUtilDoVeiculoController.text =
          _veiculo.anosDeVidaUtilDoVeiculo != null
              ? _veiculo.anosDeVidaUtilDoVeiculo.toString()
              : "";
      _marcaModeloVeiculoController.text =
          _veiculo.marcaModeloVeiculo?.descricao ?? '';
      _tipoCombustivelController.text =
          _veiculo.tipoCombustivel?.descricao ?? '';
      _corController.text = _veiculo.corVeiculo?.descricao ?? '';
    }

    bool permissionarioMode = _veiculoStore.usuario!.permissionario != null;
    bool fiscalMode = _veiculoStore.usuario!.fiscal != null;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Veículo',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: CardEditFieldsTile(
              title: 'Dados do Veículo',
              voidCallback: permissionarioMode
                  ? () {
                      _veiculoStore.editVeiculo(
                          context: context,
                          scaffoldKey: _scaffoldKey,
                          screenToOpen: VeiculoDadosScreen());
                    }
                  : null,
              child: Column(
                children: <Widget>[
                  CustomInputFieldGrey(
                    controller: _placaController,
                    label: "PLACA",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _renavanController,
                    label: "RENAVAN",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _chassiController,
                    label: "CHASSI",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDeFabricacaoController,
                    label: "ANO DE FABRICACAO",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoDoModeloController,
                    label: "ANO DO MODELO",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _capacidadeController,
                    label: "CAPACIDADE",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoDaCapacidadeController,
                    label: "TIPO DA CAPACIDADE:",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _observacaoDaCapacidadeController,
                    label: "OBSERVAÇÃO DA CAPACIDADE",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anosDeVidaUtilDoVeiculoController,
                    label: "ANOS DE VIDA",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _marcaModeloVeiculoController,
                    label: "MARCA MODELO",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _tipoCombustivelController,
                    label: "TIPO DE COMBUSTIVEL",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _corController,
                    label: "COR",
                    obscure: false,
                    enabled: permissionarioMode,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  fiscalMode
                      ? CustomRaisedButtonBlue(
                          label: "Aplicar Multa",
                          func: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EmissaoDeMultaScreen(
                                    _veiculo, _scaffoldKey)));
                          })
                      : Container()
                ],
              ),
            ),
          ),
        ));
  }
}
