import 'package:cityconnect/screen/condutor_search_screen.dart';
import 'package:cityconnect/screen/veiculo_screen.dart';
import 'package:cityconnect/widgets/box_item.dart';
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
