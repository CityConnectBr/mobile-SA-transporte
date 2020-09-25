import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
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
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore _condutorStore = Provider.of<CondutorStore>(context);

    return Stack(
      children: <Widget>[
        Form(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: CustomFormInputField(
              controller: _searchController,
              label: "Buscar condutor",
              obscure: false,
              type: TextInputType.text,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 16.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  "images/icon-search.png",
                  //width: 50,
                  width: 22.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  _condutorStore.pesquisarCondutores(
                      search: this._searchController.text,
                      scaffoldKey: _scaffoldKey,
                      context: context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
