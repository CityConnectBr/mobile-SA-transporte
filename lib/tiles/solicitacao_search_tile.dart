import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/solicitacao_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSolicitacaoTile extends StatefulWidget {
  SearchSolicitacaoTile(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _SearchSolicitacaoTileState createState() =>
      _SearchSolicitacaoTileState(_scaffoldKey);
}

class _SearchSolicitacaoTileState extends State<SearchSolicitacaoTile> {
  _SearchSolicitacaoTileState(this._scaffoldKey);

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
    SolicitacaoStore _solicitacaoStore = Provider.of<SolicitacaoStore>(context);

    return CustomSearch(
      controller: _searchController,
      label: "Buscar Solicitação",
      onTap: () {
        _solicitacaoStore.pesquisar(
            search: this._searchController.text,
            scaffoldKey: _scaffoldKey,
            context: context);
      },
    );
  }
}
