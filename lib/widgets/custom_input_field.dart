import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool obscure;
  final TextInputType? type;
  final int? maxLines;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;

  CustomInputField(
      {this.controller,
      this.icon,
      this.hint,
      this.label,
      this.obscure = false,
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
        obscureText: obscure,
        keyboardType: type,
        maxLines: maxLines);
  }
}

class CustomInputFieldGrey extends StatelessWidget {
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final String? label;
  final bool obscure;
  final bool enabled;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  CustomInputFieldGrey(
      {this.controller,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.hint,
      this.label,
      this.obscure = false,
      this.type,
      this.validator,
      this.onEditingComplete,
      this.onChanged,
      this.enabled = true,
      this.maxLength,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: (enabled) ? const Color(0xFFF7F8F9) : Colors.grey[200],
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        errorText: null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFFc3c3c3), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFFe3e3e3), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      style: const TextStyle(color: Color(0xFF444444), fontSize: 18.0),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscure,
      keyboardType: type,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
    );
  }
}

class CustomInputFieldWhite extends StatelessWidget {
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final String? label;
  final bool obscure;
  final bool enabled;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int? maxLength;

  CustomInputFieldWhite(
      {this.controller,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.hint,
      this.label,
      this.obscure = false,
      this.type,
      this.validator,
      this.onEditingComplete,
      this.onChanged,
      this.enabled = true,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: (this.enabled) ? Colors.white : Colors.grey[200],
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        errorText: null,
        focusedBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      style: const TextStyle(color: Color(0xFF444444), fontSize: 18.0),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscure,
      keyboardType: type,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
    );
  }
}
