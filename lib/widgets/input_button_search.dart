import 'package:flutter/material.dart';
import 'package:satrans_new_app/utils/customTheme.dart';

class InputButtonSearch extends StatelessWidget {
  const InputButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(5.0),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: TextStyle(color: CustomTheme.primaryColor, fontSize: 18.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0),                  
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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: CustomTheme.primaryColor,
                size: 35.0,
              ),
            ),
          ),
        ],
      ),
    );    
  }
}
