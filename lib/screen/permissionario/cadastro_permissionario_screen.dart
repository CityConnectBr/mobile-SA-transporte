import 'package:cityconnect/tiles/cadastro_permissionario_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class CadastroPermissionarioScreen extends StatefulWidget {
  @override
  _CadastroPermissionarioScreenState createState() =>
      _CadastroPermissionarioScreenState();
}

class _CadastroPermissionarioScreenState
    extends State<CadastroPermissionarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#E0E0E0"),
      appBar: AppBar(
        title: const Text(
          'Novo Permissionário',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.navigate_before,
            size: 45.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
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
              Container(
                width: 280.0,
                margin: EdgeInsets.only(right: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: Util.hexToColor("#828282"),
                      ),
                    ),
                  ],
                ),
              ),
              PermissionarioTile(),
            ],
          ),
        ),
      ),
    );
  }
}
