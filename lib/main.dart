import 'package:flutter/material.dart';
import 'package:satrans_new_app/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SA TRANSPORTES',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF0d8bc6),
          ),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        ),
        debugShowCheckedModeBanner: false,
        home: const FirstScreen());
  }
}
