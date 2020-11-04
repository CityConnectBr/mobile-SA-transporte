import 'package:cityconnect/screen/cadastro_usuario_screen.dart';
import 'package:cityconnect/tiles/login_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textStyleTitleBar =
  TextStyle(color: Util.hexToColor("#505050"), fontSize: 20.0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  double heightTab = 450.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 150.0,
            // height: double.infinity,
            child: Container(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 70.0),
              color: Theme.of(context).primaryColor,
              child: Image.asset(
                "images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 5.0,
                    onTap: (index) {
                      setState(() {
                        if (index == 0)
                          heightTab = 450.0;
                        else
                          heightTab = 800.0;
                      });
                    },
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
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: heightTab,
                  child: TabBarView(children: [
                    LoginTile(_scaffoldKey),
                    //////////////////////
                    CadastroUsuarioScreen(_scaffoldKey)
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
