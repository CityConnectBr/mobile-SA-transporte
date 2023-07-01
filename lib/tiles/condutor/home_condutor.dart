import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/screen/condutor/alvara_digital_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_search_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_show_screen.dart';
import 'package:sa_transportes_mobile/widgets/box_item.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';

class HomeCondutorTile extends StatefulWidget {
  @override
  _HomeCondutorTileState createState() => _HomeCondutorTileState();
}

class _HomeCondutorTileState extends State<HomeCondutorTile> {
  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

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
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VeiculoShowScreen()));
             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeiculoEditScreen()));
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
