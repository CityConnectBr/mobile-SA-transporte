import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CardCondutorTile extends StatefulWidget {
  final Condutor _condutor;

  CardCondutorTile(this._condutor);

  @override
  State<CardCondutorTile> createState() =>
      _CardCondutorTileState(this._condutor);
}

class _CardCondutorTileState extends State<CardCondutorTile> {
  final Condutor _condutor;

  _CardCondutorTileState(this._condutor);

  var flagFoto = false;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CondutorStore>(context);

    if (!flagFoto) {
      flagFoto = true;
      store.loadPhotoFromCondutor(this._condutor);
    }

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
          Observer(builder: (_) {
            return Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (store.fotoCondutorFile != null
                          ? FileImage(store.fotoCondutorFile!)
                          : AssetImage("images/photo-user.jpeg"))
                      as ImageProvider<Object>,
                ),
              ),
            );
          }),
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
