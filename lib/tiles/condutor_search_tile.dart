import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCondutorTile extends StatefulWidget {
  SearchCondutorTile(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _SearchCondutorTileState createState() =>
      _SearchCondutorTileState(_scaffoldKey);
}

class _SearchCondutorTileState extends State<SearchCondutorTile> {
  _SearchCondutorTileState(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore _condutorStore = Provider.of<CondutorStore>(context);

    return CustomSearch(
      controller: _searchController,
      label: "Buscar Condutor",
      onTap: () {
        _condutorStore.pesquisar(
            search: this._searchController.text,
            scaffoldKey: _scaffoldKey,
            context: context);
      },
    );
  }
}
