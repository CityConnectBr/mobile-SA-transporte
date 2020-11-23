import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;

class PhotoPersonTile extends StatefulWidget {
  String _imagePath;
  Function _callBack;

  PhotoPersonTile({String imagePath = null, Function callBack}) {
    this._imagePath = imagePath;
    this._callBack = callBack;
  }

  @override
  _PhotoPersonTileState createState() => _PhotoPersonTileState(this._imagePath, this._callBack);
}

class _PhotoPersonTileState extends State<PhotoPersonTile> {
  _PhotoPersonTileState(String image, Function callBack) {
    this._imagePath = image;
    this._callBack = callBack;
  }

  final _picker = ImagePicker();
  String _imagePath;
  Function _callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Util.hexToColor("#2D9CDB"),
      height: 160.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _imagePath != null ? FileImage(File(_imagePath)) : AssetImage("images/photo-user.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -5.0,
                right: -10.0,
                child: GestureDetector(
                  child: Image.asset(
                    "images/icon-cam.png",
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  onTap: () async {
                    final pickedFile = await _picker.getImage(source: ImageSource.camera);

                    if (pickedFile != null) {
                      print(pickedFile.path);
                      _callBack(pickedFile.path);
                      setState(() {
                        this._imagePath = pickedFile.path;
                      });
                    } else {
                      print('Nenhuma Imagem Selecionada.');
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
