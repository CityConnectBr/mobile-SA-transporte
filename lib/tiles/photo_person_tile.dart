import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;

class PhotoPersonTile extends StatefulWidget {
  static final int CAM_INSIDE_PHOTO = 0;
  static final int BUTTON_BELOW_PHOTO = 1;

  String _imagePath;
  Function _callBack;
  double size;
  int typeButton;

  PhotoPersonTile({String imagePath = null, Function callBack, double size = 120.0, int typeButton = 0}) {

    if(imagePath!=null && imagePath.length>0){
      this._imagePath = imagePath;
    }
    this._callBack = callBack;
    this.size = size;
    this.typeButton = typeButton;
  }

  @override
  _PhotoPersonTileState createState() => _PhotoPersonTileState(this._imagePath, this._callBack, this.size, this.typeButton);
}

class _PhotoPersonTileState extends State<PhotoPersonTile> {
  _PhotoPersonTileState(String image, Function callBack, double size, int typeButton) {
    this._imagePath = image;
    this._callBack = callBack;
    this.width = size;
    this.height = size;
    this.typeButton = typeButton;
  }

  final _picker = ImagePicker();
  String _imagePath;
  Function _callBack;
  double width;
  double height;
  int typeButton;

  @override
  Widget build(BuildContext context) {
    Widget photoContainer = Container(
      padding: EdgeInsets.only(top: 20.0),
      height: (width > height ? width : height) + 40.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _imagePath != null ? FileImage(File(_imagePath)) : AssetImage("images/photo-user.jpeg"),
                ),
              ),
            ),
          ),
          typeButton == 0
              ? Positioned(
                  top: -5.0,
                  right: -10.0,
                  child: Image.asset(
                    "images/icon-cam.png",
                    height: width * .40,
                    fit: BoxFit.contain,
                  ),
                )
              : Container()
        ],
      ),
    );

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _callBack == null
              ? photoContainer
              : GestureDetector(
                  child: photoContainer,
                  onTap: _callBack != null ? _capturePhoto : () {},
                ),
          typeButton == 1
              ? CustomRaisedButtonWhite(
                  label: "Selecionar Foto",
                  func: _callBack != null ? _capturePhoto : () {},
                )
              : Container()
        ],
      ),
    );
  }

  _capturePhoto() async {
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
  }
}
