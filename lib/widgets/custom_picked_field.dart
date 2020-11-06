import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomPickedField extends StatefulWidget {
  String _imagePath;
  String _text;
  Function _callBack;

  CustomPickedField({String imagePath, String text, Function callBack}) {
    this._imagePath = imagePath;
    this._text = text;
    this._callBack = callBack;
  }

  @override
  _CustomPickedFieldState createState() =>
      _CustomPickedFieldState(this._imagePath, this._text, this._callBack);
}

class _CustomPickedFieldState extends State<CustomPickedField> {
  final _picker = ImagePicker();
  String _imagePath;
  String _text;
  Function _callBack;

  _CustomPickedFieldState(String image, String text, Function callBack) {
    this._imagePath = image;
    this._text = text;
    this._callBack = callBack;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.topLeft,
            child: _imagePath != null
                ? Image.asset(
                    _imagePath,
                    height: 140,
                    fit: BoxFit.contain,
                  )
                : Text(
                    "Nenhuma imagem selecionada",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
          ),
          onTap: () async {
            final pickedFile =
                await _picker.getImage(source: ImageSource.camera);

            if (pickedFile != null) {
              //print(pickedFile.path);
              setState(() {
                _imagePath = pickedFile.path;
              });
              _callBack(pickedFile.path);
            } else {
              print('Nenhuma Imagem Selecionada.');
            }
          },
        ),
      ],
    );
  }
}
