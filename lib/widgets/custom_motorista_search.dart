import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CustomMotoristaSearchResult extends StatelessWidget {
  final String imagem;
  final String name;
  final String cnh;
  final String vencimentoCNH;

  CustomMotoristaSearchResult({
    this.imagem,
    this.name,
    this.cnh,
    this.vencimentoCNH,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Row(
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
                        AssetImage(imagem))),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextSearchResult(
                  customText: name,
                  color: Util.hexToColor("#828282"),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextSearchResult(
                  customText: "CNH: ",
                  item: cnh,
                  color: Util.hexToColor("#828282"),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextSearchResult(
                  customText: "Vencimento: ",
                  item: vencimentoCNH,
                  color: Util.hexToColor("#828282"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
