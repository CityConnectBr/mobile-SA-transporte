import 'package:cityconnect/screen/search_condutor_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/tiles/custom_list_tile.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:cityconnect/util/extensions.dart';

class CustomDrawerTile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomDrawerTile(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

    final acoesPermissionarioMap = [
      CustomListTile(
        title: "ALVARÁ DE PERMISSÃO",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "ALVARÁ DIGITAL",
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SearchCondutorScreen()));
        },
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "CONDUTORES",
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SearchCondutorScreen()));
        },
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "VEÍCULOS",
        onTap: () {
//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (context) => CondutorScreen()));
        },
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "SUPORTE",
        onTap: () {},
      ),
    ];

    final acoesCondutorMap = [
      CustomListTile(
        title: "ALVARÁ DE PERMISSÃO",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "ALVARÁ DIGITAL",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "VEÍCULO",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "SUPORTE",
        onTap: () {},
      ),
    ];

    final acoesFiscalMap = [
      CustomListTile(
        title: "VEÍCULOS",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "CONDUTORES",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "MULTAS",
      ),
      SizedBox(height: 24.0),
      CustomListTile(
        title: "SUPORTE",
        onTap: () {},
      ),
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
                  Stack(
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
                                    image:
                                        //_fotoStr != null
                                        // ? FileImage(File(_fotoStr))
                                        // :
                                        AssetImage("images/photo-user.png"),
                                  )),
                            );
                          })),
                      Positioned(
                        right: -15.0,
                        top: -10.0,
                        child: GestureDetector(
                          child: Image.asset(
                            "images/ic_edit.png",
                            fit: BoxFit.contain,
                          ),
                          onTap: () {
                            usuarioStore.editUser(
                                context: context, scaffoldKey: scaffoldKey);
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Observer(builder: (_) {
                    return Text(
                      usuarioStore.usuario.nome.capitalize(),
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
                      usuarioStore.usuario.tipo.nome.capitalize(),
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
            if (usuarioStore.usuario.tipo.id == 1) {
              return Column(
                children: acoesPermissionarioMap,
              );
            } else if (usuarioStore.usuario.tipo.id == 2) {
              return Column(
                children: acoesCondutorMap,
              );
            } else if (usuarioStore.usuario.tipo.id == 3) {
              return Column(
                children: acoesFiscalMap,
              );
            }

            return Container();
          }),
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomListTile(
                  title: "SAIR",
                  onTap: () {
                    usuarioStore.logout(context: context);
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
