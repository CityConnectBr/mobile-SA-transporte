import 'package:flutter/material.dart';

class CardEditFieldsTile extends StatefulWidget {
  final String title;
  final Widget child;
  final VoidCallback voidCallback;

  CardEditFieldsTile({this.title, this.child, this.voidCallback}) {}

  @override
  _CardEditFieldsTileState createState() => _CardEditFieldsTileState(title: title, child: child, voidCallback: voidCallback);
}

class _CardEditFieldsTileState extends State<CardEditFieldsTile> {
  final String title;
  final Widget child;
  final VoidCallback voidCallback;

  _CardEditFieldsTileState({this.title = "", this.child, this.voidCallback = null}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "images/icon-edit-car.png",
                  height: 14,
                  fit: BoxFit.contain,
                ),
              ),
              onTap: voidCallback,
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        child != null ? child : Container(),
      ],
    );
  }
}
