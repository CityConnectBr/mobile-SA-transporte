import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class SnackMessages{

  static void showSnackBar(BuildContext context, GlobalKey<ScaffoldState> key, String text, {int secs}){
    key.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: secs??3),
    ));
  }

  static void showSnackBarSuccess(BuildContext context, GlobalKey<ScaffoldState> key, String text, {int secs}){
    key.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Util.hexToColor("#31aa52"),
      duration: Duration(seconds: secs??3),
    ));
  }

  static void showSnackBarError(BuildContext context, GlobalKey<ScaffoldState> key, String text, {int secs}){
    key.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Util.hexToColor("#a81533"),
      duration: Duration(seconds: secs??5),
    ));
  }

  static void showSnackBarWarning(BuildContext context, GlobalKey<ScaffoldState> key, String text, {int secs}){
    key.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Util.hexToColor("#d2950d"),
      duration: Duration(seconds: secs??5),
    ));
  }


}