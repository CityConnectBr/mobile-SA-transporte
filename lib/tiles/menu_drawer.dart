import 'package:cityconnect/screen/condutor/alvara_digital_screen.dart';
import 'package:cityconnect/screen/condutor_search_screen.dart';
import 'package:cityconnect/screen/fiscal/emissao_multa_screen.dart';
import 'package:cityconnect/screen/permissionario/alvara_digital_screen.dart';
import 'package:cityconnect/screen/permissionario/boletos_screen.dart';
import 'package:cityconnect/screen/permissionario/solicitacoes_screen.dart';
import 'package:cityconnect/screen/veiculo_search_screen.dart';
import 'package:cityconnect/stores/main_store.dart';
import 'package:cityconnect/tiles/custom_list_tile.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:cityconnect/util/extensions.dart';

class MenuDrawerTile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MenuDrawerTile(this.scaffoldKey);

  final double heightSpace = 18.0;

  FotoAux fotoAux;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    MainStore mainStore = Provider.of<MainStore>(context);

    mainStore.loadPhoto().then((value) => {
      fotoAux = value,
    });
    
    final acoesPermissionarioMap = [
      CustomListTile(
        title: "ALVARÁ DIGITAL",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlvaraDigitalPermissionarioScreen()));
        },
      ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "CONDUTORES",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchCondutorScreen()));
        },
      ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "VEÍCULOS",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchVeiculoScreen()));
        },
      ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "BOLETOS",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoletosScreen()));
        },
      ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "SOLICITAÇÕES",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SolicitacoesScreen()));
        },
      ),
      SizedBox(height: height * .05),
    ];

    final acoesCondutorMap = [
      CustomListTile(
        title: "ALVARÁ DIGITAL",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlvaraDigitalScreen()));
        },
      ),
      SizedBox(height: height * .35),
    ];

    final acoesFiscalMap = [
      CustomListTile(
          title: "VEÍCULOS",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchVeiculoScreen()));
          }),
      SizedBox(height: heightSpace),
      CustomListTile(
          title: "EMISSÃO DE MULTAS",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmissaoDeMultaScreen()));
          }),
      SizedBox(height: height * .30),
    ];

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Util.hexToColor("#2D9CDB"),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: 80.0,
                            height: 80.0,
                            child: Observer(builder: (_) {
                              return Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: mainStore.showPhotoFake
                                          ? AssetImage("images/photo-user.jpeg")
                                          : NetworkImage(this.fotoAux.urlFoto, headers: this.fotoAux.header),
                                    )),
                              );
                            })),
                        Positioned(
                            right: -20.0,
                            top: -15.0,
                            child: Image.asset(
                              "images/ic_edit.png",
                              fit: BoxFit.contain,
                            )),
                      ],
                    ),
                    onTap: () {
                      mainStore.editUser(context: context, scaffoldKey: scaffoldKey);
                    },
                  ),
                  Spacer(),
                  Observer(builder: (_) {
                    return Text(
                      mainStore.usuario.nome.capitalize(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "InterBold",
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return Text(
                      mainStore.usuario.tipo.nome.capitalize(),
                      style: TextStyle(
                        fontFamily: "InterRegular",
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Observer(builder: (_) {
            if (mainStore.usuario.tipo.id == 1) {
              return Column(
                children: acoesPermissionarioMap,
              );
            } else if (mainStore.usuario.tipo.id == 2) {
              return Column(
                children: acoesCondutorMap,
              );
            } else if (mainStore.usuario.tipo.id == 3) {
              return Column(
                children: acoesFiscalMap,
              );
            }

            return Container();
          }),
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomListTile(
                  title: "SAIR",
                  onTap: () {
                    mainStore.logout(context: context);
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 32.0,
                  ),
                  height: 40.0,
                  child: Image.asset(
                    "images/logo_santo_andre.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
