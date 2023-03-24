import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFF0d8bc6),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );

  static const Color primaryColor = Color(0xFF12407c);
  static const Color secondaryColor = Color(0xFF0d8bc6);
  static const Color backgroundColor = Color(0xFF12407c);
  static const Color textColor = Colors.white;
}
