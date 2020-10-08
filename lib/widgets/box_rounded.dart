import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';

class BoxRounded extends StatefulWidget {
  Widget _child;

  BoxRounded({@required Widget child}) {
    this._child = child;
  }

  @override
  _BoxRoundedState createState() => _BoxRoundedState(this._child);
}

class _BoxRoundedState extends State<BoxRounded> {
  final Widget _child;

  _BoxRoundedState(this._child);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 14.0, bottom: 25.0, left: 40.0, right: 40.0),
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
          _child
        ],
      ),
    );
  }
}

class BoxStackRounded extends StatefulWidget {
  Widget _child;

  BoxStackRounded({@required Widget child}) {
    this._child = child;
  }

  @override
  _BoxStackRoundedState createState() => _BoxStackRoundedState(this._child);
}

class _BoxStackRoundedState extends State<BoxStackRounded> {
  final Widget _child;

  _BoxStackRoundedState(this._child);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: this._child,
    );
  }
}
