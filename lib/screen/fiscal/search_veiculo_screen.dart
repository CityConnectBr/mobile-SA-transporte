import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/tiles/search_veiculo_tile.dart';

class SearchVeiculoScreen extends StatefulWidget {
  @override
  _SearchVeiculoScreenState createState() => _SearchVeiculoScreenState();
}

class _SearchVeiculoScreenState extends State<SearchVeiculoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#E0E0E0"),
      appBar: AppBar(
        title: const Text(
          'Veículos',
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
            color: Colors.white,
          ),
          width: 390.0,
          height: 300.0,
          child: Column(
            children: <Widget>[
              Container(
                width: 280.0,
                margin: EdgeInsets.only(right: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'OK, só precisamos que você insira o número da ',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Util.hexToColor("#828282"),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'placa ',
                            style: TextStyle(
                              color: Util.hexToColor("#6fcf97"),
                            ),
                          ),
                          TextSpan(
                            text: 'do veículo',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SearchTile(),
            ],
          ),
        ),
      ),
    );
  }
}
