import 'package:sa_transportes_mobile/util/custom_theme.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';

class CustomRaisedButtonWhite extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback func;

  CustomRaisedButtonWhite({this.icon, this.label = "", required this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomTheme.backgroundColor,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: func,
      child: Text(label),
    );
  }
}

class CustomRaisedButtonBlue extends StatelessWidget {
  IconData? icon;
  String? label;
  final VoidCallback? func;
  Widget? child;

  CustomRaisedButtonBlue({this.icon, required this.label, this.func});

  CustomRaisedButtonBlue.withChild({required this.child, this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: CustomTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: func,
      child: child ?? Text(label!, style: TextStyle(fontSize: 18)),
    );
  }
}

class CustomRaisedButtonYellow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? func;

  CustomRaisedButtonYellow({required this.icon, required this.label, this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: func,
      child: Text(label, style: TextStyle(fontSize: 18)),
    );
  }
}
