import 'dart:io';

import 'package:cityconnect/screen/permissionario/cadastro_permissionario_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_veiculo_screen.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/screen/loading_screen.dart';
import 'package:cityconnect/util/util.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SA TRANS',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Util.hexToColor(
            "#2d9cdb"), // // (barras de ferramentas, barras de guia, etc)
        accentColor: Util.hexToColor(
            "#ffffff"), // (botões, texto, efeito de borda overscroll, etc)
        //accentColorBrightness: , // Usado para determinar a cor do texto e dos ícones colocados na parte superior da cor de destaque (por exemplo, os ícones em um botão de ação flutuante).
        buttonColor: Util.hexToColor("#444444"), //,
        errorColor: Colors.yellow, //
        appBarTheme: AppBarTheme(
            color: Util.hexToColor("#2d9cdb"), //,
            textTheme: TextTheme(
              title: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),

        // Define the default font family.
        //fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Hind',
              color: Util.hexToColor("#797979")),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: LoadingStartScreen(),
      home: CadastroVeiculoScreen(),
    );
  }
}
