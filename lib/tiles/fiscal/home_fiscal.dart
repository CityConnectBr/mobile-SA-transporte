import 'package:cityconnect/widgets/custom_box_home.dart';
import 'package:flutter/material.dart';

class HomeFiscalTile extends StatefulWidget {
  @override
  _HomeFiscalTileState createState() => _HomeFiscalTileState();
}

class _HomeFiscalTileState extends State<HomeFiscalTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomBoxHome(
            icon: "images/icon-eye.png",
            description: "Visualizar Motoristas",
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomBoxHome(
            icon: "images/icon-face.png",
            description: "Novo Permissionário",
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomBoxHome(
            icon: "images/icon-car.png",
            description: "Novo Veículo",
          ),
        ],
      ),
    );
  }
}
