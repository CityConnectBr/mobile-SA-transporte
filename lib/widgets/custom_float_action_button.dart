import 'package:flutter/material.dart';

class CustomFloatActionButton extends StatelessWidget {

  final IconData? iconButton;
  final Function? function;

  CustomFloatActionButton(this.iconButton, this.function);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(iconButton, color: Colors.white,),
      onPressed: function != null ? function as void Function()? : null,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class CustomFloatActionButtonExtended extends StatelessWidget {

  final IconData? iconButton;
  final Widget? label;
  final Function? function;

  CustomFloatActionButtonExtended(this.iconButton, this.label, this.function);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(iconButton, color: Colors.white,),
      label: label ?? Text(""),
      onPressed: function != null ? function as void Function()? : null,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}