import 'package:sa_transportes_mobile/screen/condutor_search_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/infracoes_screen.dart';
import 'package:sa_transportes_mobile/widgets/box_item.dart';
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
                  builder: (context) => InfracoesScreen()));
            },
            child: BoxItem(
              icon: "images/icon-car.png",
              description: "Visualizar Infrações",
            ),
          ),
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
        ],
      ),
    );
  }
}
