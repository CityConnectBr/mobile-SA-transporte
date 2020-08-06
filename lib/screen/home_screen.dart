import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:cityconnect/tiles/box_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 160.0,
              // height: double.infinity,
              child: Container(
                padding: EdgeInsets.all(15.0),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      "images/logo.png",
                      //width: 50,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image.asset(
                          "images/perfil.png",
                          //width: 50,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Perfil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Util.hexToColor("#FFFFFF"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 160.0,
                  // height: double.infinity,
                  child: Container(
                    padding: EdgeInsets.all(45.0),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ações do Fiscal",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Util.hexToColor("#FFFFFF"),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          CustomBoxShadowWhite(
                            label: "Buscar Veículo",
                            icon: "images/search.png",
                            heightValue: 1,
                          ),
                          Spacer(),
                          CustomBoxShadowWhite(
                            label: "Visualizar Motoristas",
                            icon: "images/location.png",
                            heightValue: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          CustomBoxShadowBlue(
                            label: "Cadastrar Permissionário",
                            icon: "images/cadastro.png",
                            heightValue: 1,
                          ),
                          Spacer(),
                          CustomBoxShadowBlue(
                            label: "Cadastrar Veículo",
                            icon: "images/cadastro_veiculo.png",
                            heightValue: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
              decoration: BoxDecoration(
                color: Util.hexToColor("#F2F2F2"),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/logo_rodape.png",
                    //width: 50,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  Spacer(),
                  Image.asset(
                    "images/logo_santo_andre.png",
                    //width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
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
