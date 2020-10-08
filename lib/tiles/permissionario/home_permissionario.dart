import 'package:cityconnect/screen/search_condutor_screen.dart';
import 'package:cityconnect/screen/search_veiculo_screen.dart';
import 'package:cityconnect/screen/veiculo_screen.dart';
import 'package:cityconnect/widgets/box_item.dart';
import 'package:flutter/material.dart';

class HomePermissionarioTile extends StatefulWidget {
  @override
  _HomePermissionarioTileState createState() => _HomePermissionarioTileState();
}

class _HomePermissionarioTileState extends State<HomePermissionarioTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchCondutorScreen()));
            },
            child: BoxItem(
              icon: "images/icon-face.png",
              description: "Visualizar Condutores",
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchVeiculoScreen()));
            },
            child: BoxItem(
              icon: "images/icon-car.png",
              description: "Visualizar Veículos",
            ),
          ),
        ],
      ),
    );
  }
}
