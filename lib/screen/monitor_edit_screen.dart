import 'package:sa_transportes_mobile/models/monitor_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/tiles/monitor_edit_dados_tile.dart';
import 'package:sa_transportes_mobile/tiles/monitor_edit_endereco_tile.dart';
import 'package:sa_transportes_mobile/tiles/photo_person_tile.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:provider/provider.dart';

class MonitorEditScreen extends StatefulWidget {

  final Monitor monitor;

  MonitorEditScreen(this.monitor);

  @override
  _MonitorEditScreenState createState() => _MonitorEditScreenState(monitor);
}

class _MonitorEditScreenState extends State<MonitorEditScreen> with SingleTickerProviderStateMixin {

  final Monitor monitor;

  _MonitorEditScreenState(this.monitor);

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
    MonitorStore _monitorStore = Provider.of<MonitorStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          this.monitor.id==null?'Novo Monitor':"Monitor",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: PhotoPersonTile(),
            onTap: (){
              _monitorStore.editFotoMonitor(context: context, scaffoldKey: _scaffoldKey);
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
              MonitorEditDadosTile(this._scaffoldKey, this.monitor),
              MonitorEditEnderecoTile(_scaffoldKey, this.monitor),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}