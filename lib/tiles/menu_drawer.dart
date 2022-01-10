import 'dart:io';

import 'package:sa_transportes_mobile/screen/condutor/alvara_digital_screen.dart';
import 'package:sa_transportes_mobile/screen/condutor_search_screen.dart';
import 'package:sa_transportes_mobile/screen/fiscal/emissao_multa_screen.dart';
import 'package:sa_transportes_mobile/screen/fiscal/veiculo_perm_search_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/alvara_digital_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/boletos_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/monitor_search_screen.dart';
import 'package:sa_transportes_mobile/screen/solicitacao_search_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_search_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_show_screen.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/tiles/custom_list_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/util/extensions.dart';

class MenuDrawerTile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MenuDrawerTile(this.scaffoldKey);

  final double heightSpace = 18.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    MainStore mainStore = Provider.of<MainStore>(context);

    mainStore.loadUsuario();

    mainStore.loadPhotoUser();
    
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
        title: "MONITORES",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchMonitorScreen()));
        },
      ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "VEÍCULOS",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchVeiculoScreen()));
        },
      ),
      //SizedBox(height: heightSpace),
      // CustomListTile(
      //   title: "BOLETOS",
      //   onTap: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoletosScreen()));
      //   },
      // ),
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "SOLICITAÇÕES",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SolicitacaoScreen()));
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
      SizedBox(height: heightSpace),
      CustomListTile(
        title: "VEÍCULOS",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoShowScreen()));
        },
      ),
      SizedBox(height: height * .35),

    ];

    final acoesFiscalMap = [
      CustomListTile(
          title: "VEÍCULOS",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchVeiculoPermScreen()));
          }),
      SizedBox(height: heightSpace),
      CustomListTile(
          title: "MULTAS EMITIDAS",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SolicitacaoScreen()));
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
                                      image: mainStore.photoUser==null
                                          ? AssetImage("images/photo-user.jpeg")
                                          : FileImage(mainStore.photoUser),
                                    )),
                              );
                            })),
    if (mainStore.usuario.tipo.id == 4)
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
                      mainStore.usuarioLogado.nome.capitalize(),
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
                      mainStore.usuarioLogado.tipo.nome.capitalize(),
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
            if (mainStore.usuarioLogado.tipo.id == 1) {
              return Column(
                children: acoesPermissionarioMap,
              );
            } else if (mainStore.usuarioLogado.tipo.id == 2) {
              return Column(
                children: acoesCondutorMap,
              );
            } else if (mainStore.usuarioLogado.tipo.id == 3) {
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
