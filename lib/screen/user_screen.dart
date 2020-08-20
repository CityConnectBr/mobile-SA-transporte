import 'package:cityconnect/tiles/edit_dados_tile.dart';
import 'package:cityconnect/tiles/edit_endereco_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _textStyleTitleBar = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 20.0,
      fontFamily: "InterRegular");

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: <Widget>[
            Container(
              color: Util.hexToColor("#2D9CDB"),
              height: 160.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: //_fotoStr != null
                                  // ? FileImage(File(_fotoStr))
                                  // :
                                  AssetImage("images/photo-user.png"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5.0,
                        right: -10.0,
                        child: GestureDetector(
                          child: Image.asset(
                            "images/icon-cam.png",
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Dados",
                      style: _textStyleTitleBar,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Endereço",
                      style: _textStyleTitleBar,
                    ),
                  ),
                ],
                indicatorWeight: 5.0,
                indicatorColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 930.0,
              child: TabBarView(children: [
                EditInformationTile(_scaffoldKey),
                //////////////////////
                EditAddressTile()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
