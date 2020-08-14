import 'package:cityconnect/tiles/card_veiculo_tile.dart';
import 'package:cityconnect/tiles/card_motorista_tile.dart';
import 'package:cityconnect/tiles/custom_hr_tile.dart';
import 'package:cityconnect/tiles/fiscal/result_veiculos_tile.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';

class ResultSearchVeiculoScreen extends StatefulWidget {
  @override
  _ResultSearchVeiculoScreenState createState() =>
      _ResultSearchVeiculoScreenState();
}

class _ResultSearchVeiculoScreenState extends State<ResultSearchVeiculoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.hexToColor("#FFFFFF"),
      appBar: AppBar(
        title: const Text(
          'Veículos',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'InterBold',
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.navigate_before,
            size: 45.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 80.0,
                  // height: double.infinity,
                  child: Container(
                    padding: EdgeInsets.all(45.0),
                    color: Util.hexToColor("#2D9CDB"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomHr(
                        customColor: "#D5DDE0",
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          border: Border.all(
                            width: 1.0,
                            color: Util.hexToColor("#D5DDE0"),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20.0),
                              color: Color.fromRGBO(234, 234, 234, 0.25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "LOC4030",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Corolla - 2003",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'InterBold',
                                          ),
                                        ),
                                        Text(
                                          "Corolla 2.0 XEI AUT. 4p - Prata",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'InterRegular',
                                          ),
                                        ),
                                        Text(
                                          "Renavan: 32569875231",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'InterRegular',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        CustomRaisedButtonBlue(
                                            label: "Aplicar Multa",
                                            func: () {
                                              //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              //    builder: (context) => HomeScreen()));
                                            }),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                    "images/icon-new-driver.png",
                                                    height: 20.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "Novo Motorista",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                    "images/icon-edit-car.png",
                                                    height: 20.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "Editar",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  ExpandablePanel(
                                    header: ResultVeiculoFiscalTile(
                                      customImage: "images/foto_motorista.png",
                                      ocupation: "Motorista",
                                      name: "Railan Rabelo",
                                    ),
                                    expanded: Container(
                                      padding: EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "CNH: 32658798512",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          Text(
                                            "Vencimento: 20/20/2021",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    tapHeaderToExpand: true,
                                    hasIcon: true,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: CustomHrBig(
                                customColor: "#D5DDE0",
                              ),
                            ),
                            ResultVeiculoFiscalTile(
                              customImage: "images/foto_motorista.png",
                              ocupation: "Permissionário",
                              name: "Railan Rabelo",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
