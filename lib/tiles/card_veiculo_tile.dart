import 'package:cityconnect/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class CardVeiculoTile extends StatefulWidget {
  @override
  _CardVeiculoTileState createState() => _CardVeiculoTileState();
}

class _CardVeiculoTileState extends State<CardVeiculoTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextSearchResult(
          customText: "Marca: ",
          item: "Ford",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomTextSearchResult(
          customText: "Modelo: ",
          item: "Fiesta Class 1.0 2p",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomTextSearchResult(
          customText: "Placa: ",
          item: "DML-8333",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomTextSearchResult(
          customText: "Ano: ",
          item: "1998",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomTextSearchResult(
          customText: "Cor: ",
          item: "Vermelho",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        CustomTextSearchResult(
          customText: "RENAVAM: ",
          item: "37861887262",
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
