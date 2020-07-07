import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final IconData icon;
  final String label;
  final String text;

  CustomText({this.icon, this.label, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Theme.of(context).disabledColor,),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(label??"", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 12),),
              Text(text??"")
            ],
          ),
        )
      ],
    );
  }
}
