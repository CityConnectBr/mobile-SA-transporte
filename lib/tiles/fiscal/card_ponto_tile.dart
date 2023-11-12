import 'package:sa_transportes_mobile/models/ponto_model.dart';
import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/card_permissionario_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CardPontoTile extends StatelessWidget {
  final Ponto _ponto;

  CardPontoTile(this._ponto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Util.hexToColor("#D5DDE0")),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Util.hexToColor("#f5f5f5"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${_ponto.descricao??""}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'InterBold',
                      ),
                    ),
                    Text(
                      "Permissionário: ${_ponto.permissionarioNome??""}",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'InterRegular',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
