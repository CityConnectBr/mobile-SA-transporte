import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVeiculoTile extends StatefulWidget {
  SearchVeiculoTile(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _SearchVeiculoTileState createState() =>
      _SearchVeiculoTileState(_scaffoldKey);
}

class _SearchVeiculoTileState extends State<SearchVeiculoTile> {
  _SearchVeiculoTileState(this._scaffoldKey);

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
      label: "Buscar Veiculo",
      onTap: () {
        _veiculoStore.pesquisar(
            search: this._searchController.text,
            scaffoldKey: _scaffoldKey,
            context: context);
      },
    );
  }
}
