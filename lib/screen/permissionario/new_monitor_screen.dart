import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/new_monitor_dados_tile.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/new_monitor_endereco_tile.dart';
import 'package:sa_transportes_mobile/tiles/photo_person_tile.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:provider/provider.dart';

class NewMonitorScreen extends StatefulWidget {
  @override
  _NewMonitorScreenState createState() => _NewMonitorScreenState();
}

class _NewMonitorScreenState extends State<NewMonitorScreen> with SingleTickerProviderStateMixin {

  final _textStyleTitleBar = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 20.0,
      fontFamily: "InterRegular");

  TabController? _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController?.indexIsChanging ?? false) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    monitorStore.tabController = this._tabController ?? TabController(length: 2, vsync: this);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Novo Monitor',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          PhotoPersonTile(
            imagePath: monitorStore.fotoMonitor,
            callBack: (String imgPath) {
              monitorStore.fotoMonitor = imgPath;
            },
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: [
              Tab(
                child: Text(
                  "Dados",
                  style: _textStyleTitleBar,
                ),
              ),
              Tab(
                child: Text(
                  "Endereço",
                  style: _textStyleTitleBar,
                ),
              ),
            ],
            indicatorWeight: 5.0,
            indicatorColor: Theme.of(context).primaryColor,
          ),
          Center(
            child: [
              NewMonitorTile(this._scaffoldKey),
              NewMonitorEnderecoTile(this._scaffoldKey),
            ][_tabController?.index ?? 0],
          ),
        ],
      ),
    );
  }
}