import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CardMensagemTile extends StatelessWidget {
  final String title;
  final String body;

  CardMensagemTile(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Util.hexToColor("#D5DDE0")),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Util.hexToColor("#f5f5f5"),
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextSearchResult(
                  customText: this.title,
                  color: StyleUtil.colorGrey,
                ),
                CustomTextSearchResult(
                  customText: this.body,
                  color: StyleUtil.colorGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
