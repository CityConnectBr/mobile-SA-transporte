import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/card_permissionario_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CardVeiculoTile extends StatelessWidget {
  final Veiculo _veiculo;
  final bool readOnly;

  CardVeiculoTile(this._veiculo, {this.readOnly = false});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    _veiculo.placa??'',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'InterBold',
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "images/icon_car.png",
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Modelo: ${_veiculo.marcaModeloVeiculo?.descricao??""}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'InterBold',
                      ),
                    ),
                    Text(
                      "Cor: ${_veiculo.corVeiculo?.descricao??''} / Ano: ${_veiculo.anoDoModelo}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'InterRegular',
                      ),
                    ),
                    Text(
                      "Renavan: ${_veiculo.renavam}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'InterRegular',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          readOnly
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ExpandablePanel(
                    header: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: const Text(
                        "Permissionário",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    expanded: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CardPermissionarioSimplesTile(
                              _veiculo.permissionario!),
                        ],
                      ),
                    ), collapsed: Container(),
                  ),
                )
//          Container(
//            child: CustomHrBig(
//              customColor: "#D5DDE0",
//            ),
//          ),
        ],
      ),
    );
  }
}
