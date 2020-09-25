import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/tiles/permissionario/card_condutor_tile.dart';
import 'package:cityconnect/tiles/search_condutor_tile.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchCondutorScreen extends StatefulWidget {
  @override
  _SearchCondutorScreenState createState() => _SearchCondutorScreenState();
}

class _SearchCondutorScreenState extends State<SearchCondutorScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    CondutorStore _condutorStore = Provider.of<CondutorStore>(context);

    _condutorStore.firstLoadList(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Util.hexToColor("#EEEEEE"),
        appBar: AppBar(
          title: const Text(
            'Condutores',
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.add),
              ),
              onTap: () {
                _condutorStore.newCondutor(
                    context: context, scaffoldKey: _scaffoldKey);
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0, bottom: 10.0),
              child: SearchCondutorTile(this._scaffoldKey),
            ),
            Observer(builder: (_) {
              if (_condutorStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              return Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: (_condutorStore.condutores != null &&
                          _condutorStore.condutores.isNotEmpty)
                      ? Column(
                          children: _condutorStore.condutores
                              .map((condutor) => GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: CardCondutorTile(condutor),
                                    ),
                                    onTap: () {
                                      _condutorStore.editCondutor(
                                          condutor: condutor,
                                          context: context,
                                          scaffoldKey: this._scaffoldKey);
                                    },
                                  ))
                              .toList(),
                        )
                      : Center(
                          child: Text(
                            "Nenhum condutor encontrado!",
                            style: StyleUtil.textBlueBoldSize20,
                          ),
                        ));
            }),
          ],
        ));
  }
}
