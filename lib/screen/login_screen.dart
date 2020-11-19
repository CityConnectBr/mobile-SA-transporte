import 'package:cityconnect/screen/cadastro_usuario_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/tiles/login_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _textStyleTitleBar = TextStyle(color: Util.hexToColor("#505050"), fontSize: 20.0);

  TabController _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  width: 180,
                  height: 180,
                )
              ],
            ),
          ),
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          brightness: Brightness.light,
        ),
      ),
      body: ListView(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
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
          Center(
            child: [
              LoginTile(this._scaffoldKey),
              CadastroUsuarioScreen(this._scaffoldKey),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}
