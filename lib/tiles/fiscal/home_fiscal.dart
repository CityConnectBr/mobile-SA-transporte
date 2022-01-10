import 'package:sa_transportes_mobile/screen/condutor_search_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/fiscal/veiculo_perm_search_screen.dart';
import 'package:sa_transportes_mobile/widgets/box_item.dart';
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
                  builder: (context) => SearchVeiculoPermScreen()));
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
