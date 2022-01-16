import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/veiculo_show_perm_tile.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/veiculo_show_veiculo_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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