import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satrans_new_app/providers/search_plate_provider.dart';
import 'package:satrans_new_app/screens/search_plate_screen.dart';
import 'package:satrans_new_app/utils/customTheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.prod");
  } else {
    await dotenv.load(fileName: ".env.develop");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchPlateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SA TRANSPORTES',
      theme: CustomTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const SearchPlateScreen(),
    );
  }
}
