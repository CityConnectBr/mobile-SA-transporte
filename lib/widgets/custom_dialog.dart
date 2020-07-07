import 'package:flutter/material.dart';

class CustomDialog {

  final String titulo;
  final Widget child;

  CustomDialog({@required this.titulo, this.child});

  void show(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(titulo, textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),),
          content: child,
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}