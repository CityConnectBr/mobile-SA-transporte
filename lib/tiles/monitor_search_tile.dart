import 'package:cityconnect/stores/permissionario/monitor_store.dart';
import 'package:cityconnect/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMonitorTile extends StatefulWidget {
  SearchMonitorTile(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _SearchMonitorTileState createState() =>
      _SearchMonitorTileState(_scaffoldKey);
}

class _SearchMonitorTileState extends State<SearchMonitorTile> {
  _SearchMonitorTileState(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore _monitorStore = Provider.of<MonitorStore>(context);

    return CustomSearch(
      controller: _searchController,
      label: "Buscar Monitor",
      onTap: () {
        _monitorStore.pesquisar(
            search: this._searchController.text,
            scaffoldKey: _scaffoldKey,
            context: context);
      },
    );
  }
}
