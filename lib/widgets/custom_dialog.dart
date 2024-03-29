import 'package:flutter/material.dart';

class CustomDialog {
  final String? titulo;
  final Widget? child;

  CustomDialog({this.titulo, this.child});

  void show(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(
            titulo ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0, color: Theme.of(context).primaryColor),
          ),
          content: child,
          actions: <Widget>[
            // define os botões na base do dialogo
            new TextButton(
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
      {required BuildContext context,
      required String text,
      bool barrierDismissible = true,
      required VoidCallback voidCallbackSim,
      required VoidCallback voidCallbackNao}) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext contextDialog) {
        return AlertDialog(
          content: Container(
            height: 210.0,
            child: Column(
              children: [
                Image.asset("images/check-dialog.png"),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "InterBold",
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.0,
                      child: TextButton(
                        child: const Text(
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
                        color: const Color(0xFF2D9CDB),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1069E3).withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      child: TextButton(
                        child: const Text(
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
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        );
      },
    );
  }

  void showMessegeDialog(
      {required BuildContext context,
      required String text,
      bool barrierDismissible = true,
      double height = 210.0,
      String? imageAsset,
      required VoidCallback voidCallback}) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext contextDialog) {
        return AlertDialog(
          content: Container(
            height: height,
            child: Column(
              children: [
                imageAsset != null ? Image.asset(imageAsset) : Container(),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "InterBold",
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Container(
                  width: 100.0,
                  child: TextButton(
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontFamily: "InterBold",
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.of(contextDialog).pop();
                      voidCallback.call();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D9CDB),
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1069E3).withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        );
      },
    );
  }
}
