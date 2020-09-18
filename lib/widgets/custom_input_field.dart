import 'package:cityconnect/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormInputField extends StatelessWidget {
  final Widget icon;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hint;
  final String label;
  final bool obscure;
  final bool enabled;
  final TextInputType type;
  final Function(String) validator;
  final Function onEditingComplete;
  final Function onChanged;
  final TextEditingController controller;
  final int maxLength;

  CustomFormInputField({
    this.controller,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.label,
    this.obscure,
    this.type,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.enabled=true,
    this.maxLength=null
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: (this.enabled)?Util.hexToColor("#F7F8F9"):Colors.grey[200],
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        errorText: null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Util.hexToColor("#c3c3c3"), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Util.hexToColor("#e3e3e3"), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
        ),
      ),
      style: TextStyle(color: Util.hexToColor("#444444")),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscure ?? false,
      keyboardType: type,
      validator: validator,
      enabled: enabled != null ? enabled : true,
      maxLength: maxLength,
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
