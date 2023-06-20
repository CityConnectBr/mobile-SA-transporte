import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerField extends StatefulWidget {
  String _imagePath;
  String _text;
  Function _callBack;

  CustomImagePickerField({String imagePath, String text, Function callBack}) {
    this._imagePath = imagePath;
    this._text = text;
    this._callBack = callBack;
  }

  @override
  _CustomImagePickerFieldState createState() =>
      _CustomImagePickerFieldState(this._imagePath, this._text, this._callBack);
}

class _CustomImagePickerFieldState extends State<CustomImagePickerField> {
  final _picker = ImagePicker();
  String _imagePath;
  String _text;
  Function _callBack;

  _CustomImagePickerFieldState(String image, String text, Function callBack) {
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
                ? Image.file(
                    File(_imagePath),
                    height: 140,
                    fit: BoxFit.contain,
                  )
                : Text(
                    "Nenhuma imagem selecionada \nClique para selecionar",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
          ),
          onTap: () async {
            final pickedFile =
                await _picker.pickImage(source: ImageSource.camera);

            if (pickedFile != null) {
              print(pickedFile.path);
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