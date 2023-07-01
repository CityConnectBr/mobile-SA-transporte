import 'package:flutter/material.dart';

class SnackMessages{

  static void showSnackBar(BuildContext context, GlobalKey<ScaffoldState>? key, String text, {int? secs}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ));
  }

  static void showSnackBarSuccess(BuildContext context, GlobalKey<ScaffoldState>? key, String text, {int? secs}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }

  static void showSnackBarError(BuildContext context, GlobalKey<ScaffoldState>? key, String text, {int? secs}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }

  static void showSnackBarWarning(BuildContext context, GlobalKey<ScaffoldState>? key, String text, {int? secs}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.orange,
    ));
  }


}