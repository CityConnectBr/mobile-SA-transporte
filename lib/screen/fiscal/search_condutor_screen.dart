import 'package:cityconnect/tiles/card_motorista_result_tile.dart';
import 'package:cityconnect/tiles/search_motorista_tile.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class SearchCondutorScreen extends StatefulWidget {
  @override
  _SearchCondutorScreenState createState() => _SearchCondutorScreenState();
}

class _SearchCondutorScreenState extends State<SearchCondutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Condutores',
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
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
              padding: EdgeInsets.all(20.0),
              child: SearchMotoristaTile(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: CardMotoristaResultTile(),
            ),
          ],
        ),
      ),
    );
  }
}
