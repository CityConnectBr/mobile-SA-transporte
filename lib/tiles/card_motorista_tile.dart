import 'package:cityconnect/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CardMotoristaTile extends StatefulWidget {
  @override
  _CardMotoristaTileState createState() => _CardMotoristaTileState();
}

class _CardMotoristaTileState extends State<CardMotoristaTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomTextSearchResult(
          customText: "Marcelo Rodrigues",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 5.0,
        ),
        CustomTextSearchResult(
          customText: "CNH: ",
          item: "57990324574",
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 5.0,
        ),
        CustomTextSearchResult(
          customText: "Vencimento: ",
          item: "09/08/2021",
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
