import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/tiles/condutor/home_condutor.dart';
import 'package:sa_transportes_mobile/tiles/menu_drawer.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/home_fiscal.dart';
import 'package:sa_transportes_mobile/tiles/permissionario/home_permissionario.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/widgets/snack_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: MenuDrawerTile(_scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "images/logo.png",
                            //width: 50,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  // height: double.infinity,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Observer(builder: (_) {
                    if (mainStore.usuario.tipo.id == 1) {
                      return HomePermissionarioTile();
                    } else if (mainStore.usuario.tipo.id == 2) {
                      return HomeCondutorTile();
                    } else if (mainStore.usuario.tipo.id == 3) {
                      return HomeFiscalTile();
                    }
                    return Container();
                  }),
                )
              ],
            ),
//            Container(
//              padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Image.asset(
//                    "images/arrow-down.png",
//                    //width: 50,
//                    width: 12.0,
//                    fit: BoxFit.contain,
//                  ),
//                ],
//              ),
//            ),
//            BoxRounded(
//              child: CustomSearch(
//                controller: _searchController,
//                label: "Buscar Veículo",
//                onTap: () {},
//              ),
//            )
          ],
        ),
      ),
    );
  }

  void _onSuccess() {
//    Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => LoginP2Screen()));
  }

  /*void _onMessage(String message) {
    SnackMessages.showSnackBar(context, _scaffoldKey, message);
  }*/

  void _onFail(String error) {
    SnackMessages.showSnackBarError(context, _scaffoldKey, error);
  }
}
