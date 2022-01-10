import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/veiculo_dados_screen.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/veiculo_show_perm_tile.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/veiculo_show_veiculo_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
//
// class VeiculoPermEditScreen extends StatefulWidget {
//   final Veiculo _veiculo;
//   final int mode; //0=visualizacao,1=edicao,2=multa
//
//   VeiculoPermEditScreen(this._veiculo, this.mode);
//
//   @override
//   _VeiculoPermEditScreenState createState() =>
//       _VeiculoPermEditScreenState(this._veiculo, this.mode);
// }
//
// class _VeiculoPermEditScreenState extends State<VeiculoPermEditScreen>
//     with SingleTickerProviderStateMixin {
//   final _placaController = TextEditingController();
//   final _renavanController = TextEditingController();
//   final _chassiController = TextEditingController();
//   final _anoDeFabricacaoController = TextEditingController();
//   final _anoDoModeloController = TextEditingController();
//   final _capacidadeController = TextEditingController();
//   final _tipoDaCapacidadeController = TextEditingController();
//   final _observacaoDaCapacidadeController = TextEditingController();
//   final _anosDeVidaUtilDoVeiculoController = TextEditingController();
//   final _marcaModeloVeiculoController = TextEditingController();
//   final _tipoCombustivelController = TextEditingController();
//   final _corController = TextEditingController();
//
//   final Veiculo _veiculo;
//   final int mode;
//
//   _VeiculoPermEditScreenState(this._veiculo, this.mode);
//
//   bool _flagIsLoad = false;
//
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     _placaController.dispose();
//     _renavanController.dispose();
//     _chassiController.dispose();
//     _anoDeFabricacaoController.dispose();
//     _anoDoModeloController.dispose();
//     _capacidadeController.dispose();
//     _tipoDaCapacidadeController.dispose();
//     _observacaoDaCapacidadeController.dispose();
//     _anosDeVidaUtilDoVeiculoController.dispose();
//     _marcaModeloVeiculoController.dispose();
//     _tipoCombustivelController.dispose();
//     _corController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);
//
//     if (!this._flagIsLoad) {
//       this._flagIsLoad = true;
//       _placaController.text = this._veiculo.placa;
//       _renavanController.text = this._veiculo.renavam;
//       _chassiController.text = this._veiculo.chassi;
//       _anoDeFabricacaoController.text = this._veiculo.anoDeFabricacao != null
//           ? this._veiculo.anoDeFabricacao.toString()
//           : "";
//       _anoDoModeloController.text = this._veiculo.anoDoModelo != null
//           ? this._veiculo.anoDoModelo.toString()
//           : "";
//       _capacidadeController.text = this._veiculo.capacidade;
//       _tipoDaCapacidadeController.text = this._veiculo.tipoDaCapacidade;
//       _observacaoDaCapacidadeController.text =
//           this._veiculo.observacaoDaCapacidade;
//       _anosDeVidaUtilDoVeiculoController.text =
//       this._veiculo.anosDeVidaUtilDoVeiculo != null
//           ? this._veiculo.anosDeVidaUtilDoVeiculo.toString()
//           : "";
//       _marcaModeloVeiculoController.text =
//       this._veiculo.marcaModeloVeiculo != null
//           ? this._veiculo.marcaModeloVeiculo.descricao
//           : "";
//       _tipoCombustivelController.text = this._veiculo.tipoCombustivel != null
//           ? this._veiculo.tipoCombustivel.descricao
//           : "";
//       _corController.text = this._veiculo.corVeiculo != null
//           ? this._veiculo.corVeiculo.descricao
//           : "";
//     }
//
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(
//           'Veículo',
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             children: <Widget>[
//           Row(
//           children: <Widget>[
//             Text(
//             "Dados do Veículo",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 22.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 70),
//           ]),
//         Column(
//           children: <Widget>[
//             CustomInputFieldGrey(
//               controller: _placaController,
//               label: "PLACA",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _renavanController,
//               label: "RENAVAN",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _chassiController,
//               label: "CHASSI",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _anoDeFabricacaoController,
//               label: "ANO DE FABRICACAO",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _anoDoModeloController,
//               label: "ANO DO MODELO",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _capacidadeController,
//               label: "CAPACIDADE",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _tipoDaCapacidadeController,
//               label: "TIPO DA CAPACIDADE:",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _observacaoDaCapacidadeController,
//               label: "OBSERVAÇÃO DA CAPACIDADE",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _anosDeVidaUtilDoVeiculoController,
//               label: "ANOS DE VIDA",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _marcaModeloVeiculoController,
//               label: "MARCA MODELO",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _tipoCombustivelController,
//               label: "TIPO DE COMBUSTIVEL",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             CustomInputFieldGrey(
//               controller: _corController,
//               label: "COR",
//               obscure: false,
//               type: TextInputType.text,
//               enabled: false,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             if (this.mode == 2)
//               CustomRaisedButtonBlue(label: "Multar", func: () {}),
//           ],
//         )],
//       ),
//     ),)
//     );
//   }
// }
class VeiculoPermEditScreen extends StatefulWidget {

  final Veiculo veiculo;

  VeiculoPermEditScreen(this.veiculo);

  @override
  _VeiculoPermEditScreenState createState() => _VeiculoPermEditScreenState(veiculo);
}

class _VeiculoPermEditScreenState extends State<VeiculoPermEditScreen> with SingleTickerProviderStateMixin {

  final Veiculo veiculo;

  _VeiculoPermEditScreenState(this.veiculo);

  final _textStyleTitleBar = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 20.0,
      fontFamily: "InterRegular");

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
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Veículos",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: [
              Tab(
                child: Text(
                  "Veículo",
                  style: _textStyleTitleBar,
                ),
              ),
              Tab(
                child: Text(
                  "Permissionário",
                  style: _textStyleTitleBar,
                ),
              ),
            ],
            indicatorWeight: 5.0,
            indicatorColor: Theme.of(context).primaryColor,
          ),
          Center(
            child: [
              VeiculoShowVeiculoTile(this._scaffoldKey, this.veiculo),
              //Container(),
              VeiculoShowPermTile(_scaffoldKey, this.veiculo),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}