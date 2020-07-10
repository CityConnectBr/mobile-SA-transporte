import 'package:cityconnect/tiles/cadastro_tile.dart';
import 'package:cityconnect/tiles/login_tile.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _textStyleTitleBar = TextStyle(color: Util.hexToColor("#505050"), fontSize: 20.0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 160.0,
              // height: double.infinity,
              child: Container(
                padding: EdgeInsets.all(45.0),
                color: Theme.of(context).primaryColor,
                child: Image.asset(
                  "images/logo.png",
                  //width: 50,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(tabs: [
                Tab(child: Text("Login", style: _textStyleTitleBar,),),
                Tab(child: Text("Cadastro", style: _textStyleTitleBar,),),
              ],
                indicatorWeight: 5.0,
                indicatorColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 500.0,
              child: TabBarView(children: [
                LoginTile(),
                //////////////////////
                CadastroTile()
              ]),
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
