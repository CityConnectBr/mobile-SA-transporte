import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF12407c),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFF0d8bc6),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xFF12407c))),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF12407c),
      elevation: 0.0,
    ),
  );

  static const Color primaryColor = Color(0xFF12407c);
  static const Color secondaryColor = Color(0xFF0d8bc6);
  static const Color backgroundColor = Color(0xFF12407c);
  static const Color backgroundColorLight = Color.fromARGB(255, 204, 204, 204);
  static const Color textColor = Colors.white;
  static const Color colorGrey = Color(0xFF828282);

  static const textBlueBoldSize20 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Color(0xFF2d9cdb));

  static const textBlueSize16 = TextStyle(
      color: Color(0xFF3E4958), fontSize: 16.0, fontFamily: "InterRegular");
}
