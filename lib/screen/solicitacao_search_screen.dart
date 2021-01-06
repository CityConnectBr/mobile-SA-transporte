import 'package:cityconnect/stores/permissionario/solicitacao_store.dart';
import 'package:cityconnect/tiles/permissionario/card_solicitacao_tile.dart';
import 'package:cityconnect/tiles/solicitacao_search_tile.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:cityconnect/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SolicitacaoScreen extends StatefulWidget {
  @override
  _SolicitacaoScreenState createState() => _SolicitacaoScreenState();
}

class _SolicitacaoScreenState extends State<SolicitacaoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    SolicitacaoStore _solicitacaoStore = Provider.of<SolicitacaoStore>(context);

    _solicitacaoStore.firstLoadList(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Solicitações',
        ),
        centerTitle: true,
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
                child: SearchSolicitacaoTile(this._scaffoldKey),
              ),
              Observer(builder: (_) {
                if (_solicitacaoStore.loading)
                  return Container(
                    margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: (_solicitacaoStore.solicitacoes != null &&
                        _solicitacaoStore.solicitacoes.isNotEmpty)
                        ? Column(
                      children: _solicitacaoStore.solicitacoes
                          .map((obj) => GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: CardSolicitacaoTile(obj),
                        ),
                        onTap: () {
                          // _condutorStore.showCondutor(
                          //     condutor: condutor,
                          //     context: context,
                          //     scaffoldKey: this._scaffoldKey);
                        },
                      ))
                          .toList(),
                    )
                        : Center(
                      child: Text(
                        "Nenhuma solicitação encontrada!",
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
