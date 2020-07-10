import 'package:cityconnect/screen/login_screen.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/snack_message.dart';

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
                    children: <Widget>[
                      Text("Ações do Fiscal"),
                      Row(children: <Widget>[
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),

                        ),
                        Container()
                      ],)
                    ],
                  ),
                )
              ],
            )
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
