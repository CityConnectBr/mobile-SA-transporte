import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CardCondutorTile extends StatelessWidget {
  final Condutor _condutor;

  CardCondutorTile(this._condutor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Util.hexToColor("#D5DDE0")),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Util.hexToColor("#f5f5f5"),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
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
            width: 20.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextSearchResult(
                  customText: this._condutor.nome,
                  color: StyleUtil.colorGrey,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextSearchResult(
                  customText: "CNH: ",
                  item: this._condutor.cnh,
                  color: StyleUtil.colorGrey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}