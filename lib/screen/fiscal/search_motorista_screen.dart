import 'package:cityconnect/tiles/card_motorista_result_tile.dart';
import 'package:cityconnect/tiles/search_motorista_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class SearchMotoristaScreen extends StatefulWidget {
  @override
  _SearchMotoristaScreenState createState() => _SearchMotoristaScreenState();
}

class _SearchMotoristaScreenState extends State<SearchMotoristaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Visualizar Motoristas',
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
        child: Column(
          children: <Widget>[
            //Stack(
            //children: <Widget>[
            //SearchMotoristaTile(),
            //Text("Teste"),
            //],
            //),
            Container(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 20.0,
              ),
              child: SearchMotoristaTile(),
            ),
            Container(
              child: CardMotoristaResultTile(),
            ),
          ],
        ),
      ),
    );
  }
}
