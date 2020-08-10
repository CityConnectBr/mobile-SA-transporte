import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';

class CustomHr extends StatelessWidget {
  final String customColor;

  CustomHr({this.customColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 30.0,
        height: 4.0,
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          color: Util.hexToColor(customColor),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class CustomHrBig extends StatelessWidget {
  final String customColor;

  CustomHrBig({this.customColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 1.0,
        decoration: BoxDecoration(
          color: Util.hexToColor(customColor),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
