import 'package:sa_transportes_mobile/stores/permissionario/infracao_store.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/card_infracao_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class InfracoesScreen extends StatefulWidget {
  @override
  _InfracoesScreenState createState() => _InfracoesScreenState();
}

class _InfracoesScreenState extends State<InfracoesScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    InfracaoStore store = Provider.of<InfracaoStore>(context);

    store.loadList(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Infracoes',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.only(top: 10.0),
        child: BoxStackRounded(
          child: ListView(
            children: <Widget>[
              Observer(builder: (_) {
                if (store.loading)
                  return Container(
                    margin: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                return Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: (store.infracoes != null && store.infracoes!.isNotEmpty)
                      ? Column(
                          children: store.infracoes!
                              .map(
                                (infracao) => Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: CardInfracaoTile(
                                      infracao, _scaffoldKey),
                                ),
                              )
                              .toList(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: Text(
                              "Nenhuma infração encontrada",
                              style: StyleUtil.textBlueBoldSize20,
                            ),
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
