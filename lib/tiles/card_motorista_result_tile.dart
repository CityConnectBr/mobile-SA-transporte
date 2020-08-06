import 'package:cityconnect/widgets/custom_motorista_search.dart';
import 'package:flutter/material.dart';

class CardMotoristaResultTile extends StatefulWidget {
  @override
  _CardMotoristaResultTileState createState() =>
      _CardMotoristaResultTileState();
}

class _CardMotoristaResultTileState extends State<CardMotoristaResultTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomMotoristaSearchResult(
            imagem: "images/foto_motorista.png",
            name: "Francisco de Assis",
            cnh: "65645810668",
            vencimentoCNH: "22/01/2021",
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomMotoristaSearchResult(
            imagem: "images/foto_motorista.png",
            name: "Francisco de Assis",
            cnh: "65645810668",
            vencimentoCNH: "22/01/2021",
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomMotoristaSearchResult(
            imagem: "images/foto_motorista.png",
            name: "Francisco de Assis",
            cnh: "65645810668",
            vencimentoCNH: "22/01/2021",
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomMotoristaSearchResult(
            imagem: "images/foto_motorista.png",
            name: "Francisco de Assis",
            cnh: "65645810668",
            vencimentoCNH: "22/01/2021",
          ),
        ],
      ),
    );
  }
}
