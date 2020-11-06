import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/tiles/condutor_edit_dados_tile.dart';
import 'package:cityconnect/tiles/condutor_edit_endereco_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CondutorEditScreen extends StatefulWidget {

  final Condutor condutor;

  CondutorEditScreen(this.condutor);

  @override
  _CondutorEditScreenState createState() => _CondutorEditScreenState(condutor);
}

class _CondutorEditScreenState extends State<CondutorEditScreen> with SingleTickerProviderStateMixin {

  final Condutor condutor;

  _CondutorEditScreenState(this.condutor);

  final _textStyleTitleBar = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 20.0,
      fontFamily: "InterRegular");

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
      appBar: AppBar(
        title: Text(
          this.condutor.id==null?'Novo Condutor':"Condutor",
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
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
                              AssetImage("images/photo-user.png"),
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
          Center(
            child: [
              CondutorEditDadosTile(this._scaffoldKey, this.condutor),
              CondutorEditEnderecoTile(_scaffoldKey, this.condutor),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}