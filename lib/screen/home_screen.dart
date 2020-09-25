import 'package:cityconnect/tiles/custom_drawer.dart';
import 'package:cityconnect/tiles/fiscal/home_fiscal.dart';
import 'package:cityconnect/widgets/custom_input_field_shadow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/snack_message.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: CustomDrawerTile(_scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "images/logo.png",
                      //width: 50,
                      height: 60,
                      fit: BoxFit.contain,
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
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HomeFiscalTile(),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    "images/arrow-down.png",
                    //width: 50,
                    width: 12.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 14.0, bottom: 25.0, left: 40.0, right: 40.0),
              decoration: BoxDecoration(
                color: Util.hexToColor("#FFFFFF"),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Color.fromRGBO(151, 173, 182, 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 30.0,
                      height: 4.0,
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        color: Util.hexToColor("#D5DDE0"),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Form(
                        child: CustomFormInputField(
                          controller: _searchController,
                          label: "Buscar veículo",
                          obscure: false,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 16.0,
                          right: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              child: Image.asset(
                                "images/icon-search.png",
                                //width: 50,
                                width: 22.0,
                                fit: BoxFit.contain,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
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
