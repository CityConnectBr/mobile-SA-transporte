import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perfil',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.navigate_before,
              size: 45.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 180.0,
                  // height: double.infinity,
                  child: Container(
                    padding: EdgeInsets.all(45.0),
                    color: Util.hexToColor("#9ae3e9"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Image.asset(
                        "images/icon_edit.png",
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 110.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 190.0,
                          height: 190.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Util.hexToColor("#FFFFFF"),
                                width: 6,
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: //_fotoStr != null
                                      // ? FileImage(File(_fotoStr))
                                      // :
                                      AssetImage("images/avatar.png"))),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Kátia Maria",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Util.hexToColor("#828282"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                ),
                padding: EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          "images/icon_edit_avatar.png",
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Editar Avatar",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Util.hexToColor("#828282"),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          "images/icon_dados.png",
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Meus Dados",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Util.hexToColor("#828282"),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          "images/icon_modo_noturno.png",
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Modo Noturno",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Util.hexToColor("#828282"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 40.0,
              ),
              padding: EdgeInsets.only(
                right: 25.0,
                left: 25.0,
              ),
              child: CustomRaisedButtonBlue(
                label: "Deslogar",
                func: () {
                  //Navigator.of(context).pushReplacement(
                  //  MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
          ],
        )));
  }
}
