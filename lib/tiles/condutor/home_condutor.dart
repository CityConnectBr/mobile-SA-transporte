import 'package:cityconnect/screen/search_condutor_screen.dart';
import 'package:cityconnect/screen/veiculo_screen.dart';
import 'package:cityconnect/widgets/box_item.dart';
import 'package:flutter/material.dart';

class HomeCondutorTile extends StatefulWidget {
  @override
  _HomeCondutorTileState createState() => _HomeCondutorTileState();
}

class _HomeCondutorTileState extends State<HomeCondutorTile> {
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
                  builder: (context) => VeiculoScreen(null)));
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
