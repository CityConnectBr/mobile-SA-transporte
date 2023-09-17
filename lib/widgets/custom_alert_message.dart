
import 'package:flutter/material.dart';

class CustomAlertMessage extends StatelessWidget {

  static const int SUCCESS = 0;
  static const int WANNING = 1;
  static const int ERROR = 2;

  final String message;
  final int type;

  CustomAlertMessage({required this.message, required this.type});

  @override
  Widget build(BuildContext context) {

    Color bg = Colors.green;
    Color fnt = Colors.white;

    if(type==WANNING){
      bg = Colors.yellow;
      fnt = Colors.black87;
    }else if(type==ERROR){
      bg = Colors.red;
    }

    return Container(
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: bg,
        child: Text(message, style: TextStyle(fontSize: 16, color: fnt, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
