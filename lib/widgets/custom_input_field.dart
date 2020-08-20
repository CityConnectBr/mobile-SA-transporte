import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CustomFormInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String label;
  final bool obscure;
  final bool enabled;
  final TextInputType type;
  final Function(String) validator;
  final Function onEditingComplete;
  final Function onChanged;
  final TextEditingController controller;
  final TextInputFormatter maskTextInputFormatter;

  CustomFormInputField({
    this.controller,
    this.icon,
    this.hint,
    this.label,
    this.obscure,
    this.type,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.enabled,
    this.maskTextInputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: Util.hexToColor("#F7F8F9"),
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        errorText: null,
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Util.hexToColor("#D5DDE0"),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(color: Util.hexToColor("#444444")),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscure ?? false,
      keyboardType: type,
      validator: validator,
      enabled: enabled != null ? enabled : true,
      inputFormatters: [maskTextInputFormatter],
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String label;
  final bool obscure;
  final TextInputType type;
  final int maxLines;
  final Function onEditingComplete;
  final TextEditingController controller;

  CustomInputField(
      {this.controller,
      this.icon,
      this.hint,
      this.label,
      this.obscure,
      this.type,
      this.maxLines,
      this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
          errorText: null,
        ),
        onEditingComplete: onEditingComplete,
        obscureText: obscure ?? false,
        keyboardType: type,
        maxLines: maxLines);
  }
}
