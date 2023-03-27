import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satrans_new_app/utils/custom_theme.dart';

class InputButtonSearch extends StatelessWidget {
  final String? hintText;
  final VoidCallback onPressed;
  final TextEditingController? controller;
  final TextInputFormatter? inputFormatter;

  const InputButtonSearch({
    Key? key,
    this.hintText,
    required this.onPressed,
    this.controller,
    this.inputFormatter,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              inputFormatters: inputFormatter != null
                  ? [inputFormatter!]
                  : [],
              onSubmitted: (value) => onPressed(),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText??'Pesquisar',
                hintStyle: const TextStyle(
                    color: CustomTheme.primaryColor, fontSize: 18.0),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15.0),
              ),
              
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.search,
              color: CustomTheme.primaryColor,
              size: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}
