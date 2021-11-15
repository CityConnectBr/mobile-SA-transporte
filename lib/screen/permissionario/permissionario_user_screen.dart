import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/permissionario_store.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/permissionario_edit_dados_tile.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/permissionario_edit_endereco_tile.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/permissionario_edit_password_tile.dart';
import 'package:sa_transportes_mobile/tiles/photo_person_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PermissionarioUserScreen extends StatefulWidget {
  @override
  _PermissionarioUserScreenState createState() => _PermissionarioUserScreenState();
}

class _PermissionarioUserScreenState extends State<PermissionarioUserScreen> with SingleTickerProviderStateMixin {

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
    PermissionarioStore _permissionarioStore = Provider.of<PermissionarioStore>(context);
    MainStore _mainStore = Provider.of<MainStore>(context);

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
          GestureDetector(
            child: PhotoPersonTile(imagePath: _mainStore.photoUser != null ? _mainStore.photoUser.path : null),
            onTap: () {
              _permissionarioStore.editFoto(context: context, scaffoldKey: _scaffoldKey);
            },
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
            indicatorColor: Theme
                .of(context)
                .primaryColor,
          ),
          Center(
            child: [
              PermissionarioEditDadosTile(_scaffoldKey),
              PermissionarioEditEnderecoTile(_scaffoldKey),
              PermissionarioEditPasswordTile(_scaffoldKey)
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}