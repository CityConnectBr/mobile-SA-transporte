import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/veiculo_model.dart';
import 'package:cityconnect/tiles/usuario_edit_endereco_tile.dart';
import 'package:cityconnect/tiles/condutor_edit_dados_tile.dart';
import 'package:cityconnect/tiles/condutor_edit_endereco_tile.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VeiculoScreen extends StatefulWidget {
  final Veiculo _veiculo;

  VeiculoScreen(this._veiculo);

  @override
  _VeiculoScreenState createState() => _VeiculoScreenState(this._veiculo);
}

class _VeiculoScreenState extends State<VeiculoScreen>
    with SingleTickerProviderStateMixin {
  final Veiculo _veiculo;

  _VeiculoScreenState(this._veiculo);

  TabController _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final _veiculoController = TextEditingController();
    final _especieController = TextEditingController();
    final _placaController = TextEditingController();
    final _anoController = TextEditingController();
    final _capacidadeController = TextEditingController();
    final _corController = TextEditingController();
    final _taximetroController = TextEditingController();
    final _dataVencimentoController = TextEditingController();
    final _dataEmissaoController = TextEditingController();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            this._veiculo.id == null ? 'Novo Veículo' : "Veículo",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  CustomInputFieldGrey(
                    controller: _veiculoController,
                    label: "Qual a marca do veículo?",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _especieController,
                    label: "Digite o modelo do veículo",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _placaController,
                    label: "Placa",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _anoController,
                    label: "Ano",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _capacidadeController,
                    label: "Capacidade",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _corController,
                    label: "Cor",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _taximetroController,
                    label: "Taxímetro/Tacografo:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _dataVencimentoController,
                    label: "Emissão",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _dataEmissaoController,
                    label: "Vencimento",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Salvar",
                      func: () {
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //    builder: (context) => HomeScreen()));
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
