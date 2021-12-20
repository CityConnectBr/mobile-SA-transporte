import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/card_veiculo_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/tiles/veiculo_search_tile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchVeiculoScreen extends StatefulWidget {
  @override
  _SearchVeiculoScreenState createState() => _SearchVeiculoScreenState();
}

class _SearchVeiculoScreenState extends State<SearchVeiculoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    _veiculoStore.firstLoadList(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Veículos',
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              _veiculoStore.newVeiculo(context: context, scaffoldKey: _scaffoldKey);
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
                child: SearchVeiculoTile(this._scaffoldKey),
              ),
              Observer(builder: (_) {
                if (_veiculoStore.loading)
                  return Container(
                    margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: (_veiculoStore.veiculos != null && _veiculoStore.veiculos.isNotEmpty)
                        ? Column(
                            children: _veiculoStore.veiculos
                                .map((veiculo) => GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: CardVeiculoTile(veiculo),
                                      ),
                                      onTap: () {
                                        _veiculoStore.showVeiculo(veiculo: veiculo, context: context, scaffoldKey: this._scaffoldKey);
                                      },
                                    ))
                                .toList(),
                          )
                        : Center(
                            child: Text(
                              "Nenhum veículo encontrado!",
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
