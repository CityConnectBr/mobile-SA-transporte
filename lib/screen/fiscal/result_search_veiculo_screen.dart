import 'package:cityconnect/tiles/card_veiculo_tile.dart';
import 'package:cityconnect/tiles/card_motorista_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class ResultSearchVeiculoScreen extends StatefulWidget {
  @override
  _ResultSearchVeiculoScreenState createState() =>
      _ResultSearchVeiculoScreenState();
}

class _ResultSearchVeiculoScreenState extends State<ResultSearchVeiculoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#FFFFFF"),
      appBar: AppBar(
        title: const Text(
          'Buscar Veículo',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Veículo",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: Util.hexToColor("#2d9cdb"),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "images/icon_car.png",
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CardVeiculoTile(),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Motorista",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: Util.hexToColor("#2d9cdb"),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: //_fotoStr != null
                                  // ? FileImage(File(_fotoStr))
                                  // :
                                  AssetImage("images/foto_motorista.png"))),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CardMotoristaTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
