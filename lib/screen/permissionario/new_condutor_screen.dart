import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/new_condutor_dados_tile.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/new_condutor_endereco_tile.dart';
import 'package:sa_transportes_mobile/tiles/photo_person_tile.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:provider/provider.dart';

class NewCondutorScreen extends StatefulWidget {
  @override
  _NewCondutorScreenState createState() => _NewCondutorScreenState();
}

class _NewCondutorScreenState extends State<NewCondutorScreen> with SingleTickerProviderStateMixin {

  final _textStyleTitleBar = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 20.0,
      fontFamily: "InterRegular");

  TabController? _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController?.indexIsChanging ?? false) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    condutorStore.tabController = _tabController??TabController(length: 2, vsync: this);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Novo Condutor',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          PhotoPersonTile(
            imagePath: condutorStore.fotoCondutor,
            callBack: (String imgPath) {
              condutorStore.fotoCondutor = imgPath;
            },
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
              NewCondutorTile(this._scaffoldKey),
              NewCondutorEnderecoTile(this._scaffoldKey),
            ][_tabController?.index ?? 0],
          ),
        ],
      ),
    );
  }
}