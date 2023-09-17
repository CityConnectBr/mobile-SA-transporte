import 'package:flutter/material.dart';

class CustomFormInputField extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obscure;
  final bool? enabled;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  CustomFormInputField(
      {this.controller,
      this.icon,
      this.hint,
      this.label,
      this.obscure,
      this.type,
      this.validator,
      this.onEditingComplete,
      this.onChanged,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        errorText: null,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
      ),
      style: TextStyle(color: Colors.white),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscure ?? false,
      keyboardType: type,
      validator: validator,
      enabled: enabled != null ? enabled : true,
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obscure;
  final TextInputType? type;
  final int? maxLines;
  final Function()? onEditingComplete;
  final TextEditingController? controller;

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
