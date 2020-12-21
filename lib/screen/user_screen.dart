import 'package:cityconnect/tiles/usuario_edit_dados_tile.dart';
import 'package:cityconnect/tiles/usuario_edit_endereco_tile.dart';
import 'package:cityconnect/tiles/usuario_edit_password_tile.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: AppBar(
        title: const Text(
          'Perfil',
        ),
        centerTitle: true,
      ),
      body: ListView(
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
                      child: Observer(builder: (_) {
                        return Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: //_fotoStr != null
                              // ? FileImage(File(_fotoStr))
                              // :
                              AssetImage("images/photo-user.jpeg"),
                            ),
                          ),
                        );
                      }),
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

          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: [
              Tab(
                child: Text(
                  "Dados",
                  style: StyleUtil.textBlueSize16,
                ),
              ),
              Tab(
                child: Text(
                  "Endereço",
                  style: StyleUtil.textBlueSize16,
                ),
              ),
              Tab(
                child: Text(
                  "Senha",
                  style: StyleUtil.textBlueSize16,
                ),
              ),
            ],
            indicatorWeight: 5.0,
            indicatorColor: Theme.of(context).primaryColor,
          ),
          Center(
            child: [
              EditInformationTile(_scaffoldKey),
              EditAddressTile(_scaffoldKey),
              EditPasswordTile(_scaffoldKey)
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}