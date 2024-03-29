import 'package:sa_transportes_mobile/screen/fiscal/search_ponto_screen.dart';
import 'package:sa_transportes_mobile/screen/veiculo_search_screen.dart';
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
                  builder: (context) => SearchVeiculoScreen()));
            },
            child: BoxItem(
              icon: "images/icon-car.png",
              description: "Visualizar Veículos",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchPontoScreen()));
            },
            child: BoxItem(
              icon: "images/icon-eye.png",
              description: "Pesquisar Ponto Escolar",
            ),
          ),
        ],
      ),
    );
  }
}
