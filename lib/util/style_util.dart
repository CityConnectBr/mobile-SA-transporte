import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/cupertino.dart';

class StyleUtil {
  static final colorGrey = Util.hexToColor("#828282");

  static final textBlueBoldSize20 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Util.hexToColor("#2d9cdb"));

  static final textBlueSize16 = TextStyle(
      color: Util.hexToColor("#3E4958"),
      fontSize: 16.0,
      fontFamily: "InterRegular");
}
