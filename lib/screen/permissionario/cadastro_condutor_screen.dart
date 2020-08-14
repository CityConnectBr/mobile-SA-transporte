import 'package:cityconnect/tiles/cadastro_permissionario_tile.dart';
import 'package:cityconnect/tiles/custom_hr_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class CadastroCondutorScreen extends StatefulWidget {
  @override
  _CadastroCondutorScreenState createState() => _CadastroCondutorScreenState();
}

class _CadastroCondutorScreenState extends State<CadastroCondutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#2D9CDB"),
      appBar: AppBar(
        title: const Text(
          'Novo Condutor',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'InterBold',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              CustomHr(
                customColor: "#D5DDE0",
              ),
              PermissionarioTile(),
            ],
          ),
        ),
      ),
    );
  }
}
