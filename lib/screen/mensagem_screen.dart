import 'package:sa_transportes_mobile/stores/mensagem_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/tiles/card_mensagem_tile.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/card_condutor_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MensagemScreen extends StatefulWidget {
  @override
  _MensagemScreenState createState() => _MensagemScreenState();
}

class _MensagemScreenState extends State<MensagemScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MensagemStore _store = Provider.of<MensagemStore>(context);

    _store.loadMensagens();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Mensagens',
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.cleaning_services_sharp),
            ),
            onTap: () {
              _store.clearMensagens();
            },
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: 10.0),
        child: BoxStackRounded(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    right: 20.0, left: 20.0, top: 20.0, bottom: 10.0),
                //child: MensagemTile(this._scaffoldKey),
              ),
              Observer(builder: (_) {
                return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: (_store.list.isNotEmpty)
                        ? Column(
                            children: _store.list
                                .map((item) => Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: CardMensagemTile(
                                          item?["title"] ?? '',
                                          item?["body"] ?? ''),
                                    ))
                                .toList(),
                          )
                        : Center(
                            child: Text(
                              "Nenhuma mensagem encontrada",
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
