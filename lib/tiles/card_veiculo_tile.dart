import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/tiles/fiscal/card_permissionario_tile.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CardVeiculoTile extends StatelessWidget {
  final Veiculo _veiculo;

  CardVeiculoTile(this._veiculo);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        this._veiculo.placa,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'InterBold',
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "images/icon_car.png",
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this._veiculo.marcaModeloVeiculo.descricao,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'InterBold',
                        ),
                      ),
                      Text(
                        "Cor: ${this._veiculo.corVeiculo.descricao} / Ano: ${this._veiculo.anoDoModelo}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'InterRegular',
                        ),
                      ),
                      Text(
                        "Renavan: ${this._veiculo.renavam}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'InterRegular',
                        ),
                      ),
                      (false
                          ? CustomRaisedButtonBlue(
                              label: "Aplicar Multa",
                              func: () {
                                //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                //    builder: (context) => HomeScreen()));
                              })
                          : Container())
                    ],
                  ),
                ),
              ],
            ),
          ),
          !false
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ExpandablePanel(
                    header: Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Permissionários",
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
                              this._veiculo.permissionario),
                        ],
                      ),
                    ),
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
