import 'package:cityconnect/stores/permissionario/monitor_store.dart';
import 'package:cityconnect/tiles/monitor_search_tile.dart';
import 'package:cityconnect/tiles/permissionario/card_monitor_tile.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:cityconnect/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchMonitorScreen extends StatefulWidget {
  @override
  _SearchMonitorScreenState createState() => _SearchMonitorScreenState();
}

class _SearchMonitorScreenState extends State<SearchMonitorScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    MonitorStore _monitorStore = Provider.of<MonitorStore>(context);

    _monitorStore.firstLoadList(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Monitores',
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              _monitorStore.newMonitor(
                  context: context, scaffoldKey: _scaffoldKey);
            },
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: 10.0),
        child: BoxStackRounded(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0, bottom: 10.0),
                child: SearchMonitorTile(this._scaffoldKey),
              ),
              Observer(builder: (_) {
                if (_monitorStore.loading)
                  return Container(
                    margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: (_monitorStore.monitores != null &&
                        _monitorStore.monitores.isNotEmpty)
                        ? Column(
                      children: _monitorStore.monitores
                          .map((monitor) => GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: CardMonitorTile(monitor),
                        ),
                        onTap: () {
                          _monitorStore.showMonitor(
                              monitor: monitor,
                              context: context,
                              scaffoldKey: this._scaffoldKey);
                        },
                      ))
                          .toList(),
                    )
                        : Center(
                      child: Text(
                        "Nenhum monitor encontrado!",
                        style: StyleUtil.textBlueBoldSize20,
                      ),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
