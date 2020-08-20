import 'dart:io';

import 'package:cityconnect/screen/fiscal/result_search_veiculo_screen.dart';
import 'package:cityconnect/screen/fiscal/search_condutor_screen.dart';
import 'package:cityconnect/screen/fiscal/search_veiculo_screen.dart';
import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/screen/login_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_condutor_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_veiculo_screen.dart';
import 'package:cityconnect/screen/user_screen.dart';
import 'package:cityconnect/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/screen/loading_screen.dart';
import 'package:cityconnect/util/util.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'SA TRANS',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Util.hexToColor("#2d9cdb"),
          accentColor: Util.hexToColor("#2d9cdb"),
          buttonColor: Util.hexToColor("#444444"),
          //,
          errorColor: Colors.red,
          //
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
        home: HomeScreen(),
      ),
    );
  }
}
