import 'package:flutter/material.dart';

class IdentityTile extends StatefulWidget {
  final String? customImage;
  final String? ocupation;
  final String? name;

  IdentityTile({this.customImage, this.ocupation, this.name});

  @override
  _IdentityTileState createState() => _IdentityTileState(
      customImage: this.customImage,
      ocupation: this.ocupation,
      name: this.name);
}

class _IdentityTileState extends State<IdentityTile> {
  final String? customImage;
  final String? ocupation;
  final String? name;

  _IdentityTileState({this.customImage, this.ocupation, this.name});

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
                            AssetImage(this.customImage ?? "images/photo-user.jpeg") as ImageProvider)
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
                                this.ocupation ?? "",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width*0.5),
                                child: Text(
                                  this.name ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'InterBold',
                                  ),
                                ),
                              )
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
