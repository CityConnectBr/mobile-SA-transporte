import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';

class CustomBoxShadowWhite extends StatelessWidget {
  final String icon;
  final String label;
  final double heightValue;

  CustomBoxShadowWhite(
      {@required this.icon, @required this.label, this.heightValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            //width: 50,
            height: 80,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              height: heightValue,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      width: 170.0,
      height: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        color: Colors.white,
      ),
    );
  }
}

class CustomBoxShadowBlue extends StatelessWidget {
  final String icon;
  final String label;
  final double heightValue;

  CustomBoxShadowBlue(
      {@required this.icon, @required this.label, this.heightValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            //width: 50,
            height: 80,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              height: heightValue,
              fontWeight: FontWeight.bold,
              color: Util.hexToColor("#FFFFFF"),
            ),
          )
        ],
      ),
      width: 170.0,
      height: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
