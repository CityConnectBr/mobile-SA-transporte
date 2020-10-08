
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {

  TextEditingController _searchController;
  Function _onTap;
  String _label;

  CustomSearch({
    TextEditingController controller, Function onTap, String label}){
    this._searchController = controller;
    this._onTap = onTap;
    this._label = label;
}

  @override
  _CustomSearchState createState() => _CustomSearchState(_searchController, _onTap, _label);
}

class _CustomSearchState extends State<CustomSearch> {

  final TextEditingController _searchController;
  final Function _onTap;
  final String _label;

  _CustomSearchState(this._searchController, this._onTap, this._label);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: CustomInputFieldWhite(
              controller: _searchController,
              label: _label,
              obscure: false,
              type: TextInputType.text,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 16.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  "images/icon-search.png",
                  //width: 50,
                  width: 22.0,
                  fit: BoxFit.contain,
                ),
                onTap: _onTap,
              ),
            ],
          ),
        ),
      ],
    );;
  }
}

