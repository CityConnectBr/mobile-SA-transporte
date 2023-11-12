import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/screen/login_screen.dart';
import 'package:sa_transportes_mobile/stores/fiscal/search_ponto_store.dart';
import 'package:sa_transportes_mobile/stores/search_plate_store.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/card_ponto_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:sa_transportes_mobile/widgets/footer.dart';
import 'package:sa_transportes_mobile/widgets/input_button_search.dart';

class SearchPontoScreen extends StatefulWidget {
  const SearchPontoScreen();

  @override
  State<SearchPontoScreen> createState() => _SearchPontoScreenState();
}

class _SearchPontoScreenState extends State<SearchPontoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SearchPontoStore _store = Provider.of<SearchPontoStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Pontos',
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
              InputButtonSearch(
                hintText: 'Pesquisar por ponto escolar',
                onPressed: _store.searchPontoEscolar,
                controller: _store.searchController,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Observer(builder: (_) {
                if (_store.loading)
                  return Container(
                    margin: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                return Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: (_store.pontos != null && _store.pontos!.isNotEmpty)
                      ? Column(
                          children: _store.pontos!
                              .map(
                                (ponto) => Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: CardPontoTile(ponto),
                                ),
                              )
                              .toList(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: Text(
                              _store.firstSearch
                                  ? 'Nenhum ponto encontrado'
                                  : 'Pesquise por um ponto',
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
