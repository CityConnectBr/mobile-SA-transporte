import 'package:cityconnect/tiles/cadastro_veiculo_tile.dart';
import 'package:cityconnect/tiles/custom_hr_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class CadastroVeiculoScreen extends StatefulWidget {
  @override
  _CadastroVeiculoScreenState createState() => _CadastroVeiculoScreenState();
}

class _CadastroVeiculoScreenState extends State<CadastroVeiculoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#2D9CDB"),
      appBar: AppBar(
        title: const Text(
          'Novo Veículo',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'InterBold',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              CustomHr(
                customColor: "#D5DDE0",
              ),
              VeiculoTile(),
            ],
          ),
        ),
      ),
    );
  }
}
