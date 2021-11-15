import 'package:sa_transportes_mobile/screen/condutor/alvara_digital_screen.dart';
import 'package:sa_transportes_mobile/widgets/box_item.dart';
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
                  builder: (context) => AlvaraDigitalScreen()));
            },
            child: BoxItem(
              icon: "images/icon-face.png",
              description: "Alvará Digital",
            ),
          ),
        ],
      ),
    );
  }
}
