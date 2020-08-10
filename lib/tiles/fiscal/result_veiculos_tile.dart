import 'package:flutter/material.dart';

class ResultVeiculoFiscalTile extends StatefulWidget {
  final String customImage;
  final String ocupation;
  final String name;

  ResultVeiculoFiscalTile({this.customImage, this.ocupation, this.name});

  @override
  _ResultVeiculoFiscalTileState createState() => _ResultVeiculoFiscalTileState(
      customImage: this.customImage,
      ocupation: this.ocupation,
      name: this.name);
}

class _ResultVeiculoFiscalTileState extends State<ResultVeiculoFiscalTile> {
  final String customImage;
  final String ocupation;
  final String name;

  _ResultVeiculoFiscalTileState({this.customImage, this.ocupation, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: //_fotoStr != null
                                // ? FileImage(File(_fotoStr))
                                // :
                                AssetImage(this.customImage)),
                      ),
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.ocupation,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              Text(
                                this.name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'InterBold',
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
            ],
          ),
        ],
      ),
    );
  }
}
