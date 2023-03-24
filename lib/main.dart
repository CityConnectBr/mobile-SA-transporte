import 'package:flutter/material.dart';
import 'package:satrans_new_app/screens/search_plate_screen.dart';
import 'package:satrans_new_app/utils/customTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SA TRANSPORTES',
        theme: CustomTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: const SearchPlateScreen());
  }
}
