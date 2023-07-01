import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sa_transportes_mobile/screen/login_screen.dart';
import 'package:sa_transportes_mobile/stores/search_plate_store.dart';
import 'package:sa_transportes_mobile/widgets/footer.dart';
import 'package:sa_transportes_mobile/widgets/input_button_search.dart';

class SearchPlateScreen extends StatefulWidget {
  const SearchPlateScreen();

  @override
  State<SearchPlateScreen> createState() => _SearchPlateScreenState();
}

class _SearchPlateScreenState extends State<SearchPlateScreen> {
  final _store = SearchPlateStore();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          bottomNavigationBar: orientation == Orientation.portrait
              ? Stack(
                  children: [
                    Container(
                      height: 200.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    const Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: 0.0,
                        bottom: 0.0,
                        child: Footer()),
                  ],
                )
              : null,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: const Icon(Icons.login),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF12407c),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo_borda.png',
                        fit: BoxFit.contain,
                        width: 180,
                        height: 180,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  InputButtonSearch(
                    hintText: 'Pesquisar por placa, CPF ou CNPJ',
                    onPressed: _store.searchPlate,
                    controller: _store.placaController,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Observer(
                    builder: (_) {
                      if (_store.placaValida != null) {
                        return Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: _store.placaValida!
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(
                                  _store.placaValida!
                                      ? Icons.thumb_up
                                      : Icons.thumb_down,
                                  color: Theme.of(context).primaryColor,
                                  size: 35.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Text(
                                  _store.placaValida!
                                      ? 'Autorizada a operar!'
                                      : 'Não está autorizada a operar. Para mais informações, ligue 4433-7533',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                  orientation == Orientation.landscape
                      ? Container(
                          height: 200.0,
                          color: Theme.of(context).primaryColor,
                          child: const Footer(),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
