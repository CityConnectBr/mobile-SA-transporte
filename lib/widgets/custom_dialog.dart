import 'package:cityconnect/util/util.dart';
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
          title: Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0, color: Theme.of(context).primaryColor),
          ),
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

  void showConfirmDialog(
      {BuildContext context,
        String text,
      VoidCallback voidCallbackSim,
      VoidCallback voidCallbackNao}) {
    showDialog(
      context: context,
      builder: (BuildContext contextDialog) {
        return AlertDialog(
          content: Container(
            height: 210.0,
            child: Column(
              children: [
                Image.asset("images/check-dialog.png"),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: "InterBold",
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.0,
                      child: FlatButton(
                        child: Text(
                          "Sim",
                          style: TextStyle(
                            fontFamily: "InterBold",
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(contextDialog).pop();
                          voidCallbackSim.call();
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Util.hexToColor("#2D9CDB"),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: Util.hexToColor("#1069E3").withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      child: FlatButton(
                        child: Text(
                          "Não",
                          style: TextStyle(
                            fontFamily: "InterBold",
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(contextDialog).pop();
                          voidCallbackNao.call();
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Util.hexToColor("#FFFFFF"),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        );
      },
    );
  }
}
