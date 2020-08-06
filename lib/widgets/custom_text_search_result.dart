import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';

class CustomTextSearchResult extends StatelessWidget {
  final String customText;
  final Color color;
  final String item;

  CustomTextSearchResult({
    this.customText,
    this.color,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: customText,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: this.color,
        ),
        children: <TextSpan>[
          TextSpan(
            text: item,
          ),
        ],
      ),
    );
  }
}
