import 'package:flutter/material.dart';
import 'package:satrans_new_app/utils/customTheme.dart';

class InputButtonSearch extends StatelessWidget {
  final String? hintText;
  final VoidCallback onPressed;
  final TextEditingController? controller;

  const InputButtonSearch({
    Key? key,
    this.hintText,
    required this.onPressed,
    this.controller,
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
