import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/stores/splash_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SplashStore store = Provider.of<SplashStore>(context);
    store.initApp(context: context);

    return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset("images/logo_borda.png"),
          ),
        ));
  }
}
