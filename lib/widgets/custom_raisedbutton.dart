import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';

class CustomRaisedButtonWhite extends StatelessWidget {

  final IconData icon;
  final String label;
  final VoidCallback func;

  CustomRaisedButtonWhite({@required this.icon, @required this.label, this.func});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 1000.0,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            side: BorderSide(color: Util.hexToColor("#2d9cdb"), style: BorderStyle.solid, width: 2.0)
        ),
        child: Text(
          this.label,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Util.hexToColor("#2d9cdb")),
        ),
        textColor: Colors.white,
        color: Colors.white,
        onPressed: this.func??(){},
      ),
    );
  }
}

class CustomRaisedButtonBlue extends StatelessWidget {

  final IconData icon;
  final String label;
  final VoidCallback func;

  CustomRaisedButtonBlue({@required this.icon, @required this.label, this.func});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 1000.0,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            side: BorderSide(color: Util.hexToColor("#2d9cdb"), style: BorderStyle.solid, width: 2.0)
        ),
        child: Text(
          this.label,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        textColor: Colors.white,
        color: Util.hexToColor("#2d9cdb"),
        onPressed: this.func,
      ),
    );
  }
}

