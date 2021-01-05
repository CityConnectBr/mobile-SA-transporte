import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/tiles/condutor_edit_dados_tile.dart';
import 'package:cityconnect/tiles/condutor_edit_endereco_tile.dart';
import 'package:cityconnect/tiles/photo_person_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:provider/provider.dart';

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
    CondutorStore _condutorStore = Provider.of<CondutorStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          this.condutor.id==null?'Novo Condutor':"Condutor",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: PhotoPersonTile(),
            onTap: (){
              _condutorStore.editFotoCondutor(context: context, scaffoldKey: _scaffoldKey);
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
              CondutorEditDadosTile(this._scaffoldKey, this.condutor),
              CondutorEditEnderecoTile(_scaffoldKey, this.condutor),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}