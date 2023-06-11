import 'package:flutter/material.dart';
import 'package:satrans_new_app/screens/search_plate_screen.dart';
import 'package:satrans_new_app/utils/custom_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SearchPlateScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomTheme.backgroundColor,
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset("images/logo_borda.png"),
          ),
        ));
  }
}
