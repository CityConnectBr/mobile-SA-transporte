import 'package:flutter/material.dart';

class BoxItem extends StatelessWidget {
  final String icon;
  final String description;

  BoxItem({
    this.icon,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Color.fromRGBO(151, 173, 182, 0.2),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: //_fotoStr != null
                      // ? FileImage(File(_fotoStr))
                      // :
                      AssetImage(icon)),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(description,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
        ],
      ),
    );
  }
}
