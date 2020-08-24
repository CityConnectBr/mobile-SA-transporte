import 'package:cityconnect/screen/fiscal/search_condutor_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_condutor_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_veiculo_screen.dart';
import 'package:cityconnect/screen/user_screen.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/tiles/custom_list_tile.dart';
import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawerTile extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomDrawerTile(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    UsuarioStore usuarioStore = Provider.of<UsuarioStore>(context);

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
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: //_fotoStr != null
                                    // ? FileImage(File(_fotoStr))
                                    // :
                                    AssetImage("images/photo-user.png"),
                              )),
                        ),
                      ),
                      Positioned(
                        right: -15.0,
                        top: -10.0,
                        child: GestureDetector(
                          child: Image.asset(
                            "images/ic_edit.png",
                            fit: BoxFit.contain,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Railan Rabelo",
                    style: TextStyle(
                      fontFamily: "InterBold",
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Motorista",
                    style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.0),
          CustomListTile(
            title: "VISUALIZAR CONDUTORES",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchCondutorScreen()));
            },
          ),
          SizedBox(height: 24.0),
          CustomListTile(
            title: "NOVO MOTORISTA",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadastroCondutorScreen()));
            },
          ),
          SizedBox(height: 24.0),
          CustomListTile(
            title: "NOVO VEÍCULO",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadastroVeiculoScreen()));
            },
          ),
          SizedBox(height: 24.0),
          CustomListTile(
            title: "SUPORTE",
            onTap: () {},
          ),
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
                  onTap: (){
                    usuarioStore.logout(context: context, scaffoldKey: scaffoldKey);
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
