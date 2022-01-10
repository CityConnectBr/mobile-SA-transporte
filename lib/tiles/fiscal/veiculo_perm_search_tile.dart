import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVeiculoPermTile extends StatefulWidget {
  SearchVeiculoPermTile(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _SearchVeiculoPermTileState createState() =>
      _SearchVeiculoPermTileState(_scaffoldKey);
}

class _SearchVeiculoPermTileState extends State<SearchVeiculoPermTile> {
  _SearchVeiculoPermTileState(this._scaffoldKey);

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
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    return CustomSearch(
      controller: _searchController,
      label: "Buscar Veiculo ou Permissionário",
      onTap: () {
        _veiculoStore.pesquisar(
            search: this._searchController.text,
            scaffoldKey: _scaffoldKey,
            context: context);
      },
    );
  }
}
