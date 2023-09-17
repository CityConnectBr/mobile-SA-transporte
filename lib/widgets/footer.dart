import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bottom_white.png",
          fit: BoxFit.fitWidth,
          width: width,
          alignment: Alignment.topCenter,
        ),
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          alignment: Alignment.center,
          child: Image.asset(
            "images/logo_santo_andre.png",
            fit: BoxFit.contain,
            width: 200,
          ),
        )
      ],
    );
  }
}
