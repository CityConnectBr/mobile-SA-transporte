import 'package:cityconnect/screen/permissionario/cadastro_condutor_screen.dart';
import 'package:cityconnect/tiles/login_tile.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';

class TabBarUser extends StatelessWidget {
  final _textStyleTitleBar =
      TextStyle(color: Util.hexToColor("#505050"), fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 50),
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Login",
                        style: _textStyleTitleBar,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Cadastro",
                        style: _textStyleTitleBar,
                      ),
                    ),
                  ],
                  indicatorWeight: 5.0,
                  indicatorColor: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                height: 500.0,
                child: TabBarView(children: [
                  CadastroCondutorScreen(),
                  //////////////////////
                  CadastroCondutorScreen()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
