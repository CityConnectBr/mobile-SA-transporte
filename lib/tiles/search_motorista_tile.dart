import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchMotoristaTile extends StatefulWidget {
  @override
  _SearchMotoristaTileState createState() => _SearchMotoristaTileState();
}

class _SearchMotoristaTileState extends State<SearchMotoristaTile> {
  final _motoristaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _motoristaController.dispose();
  }

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
            child: CustomFormInputField(
              controller: _motoristaController,
              label: "Buscar condutor",
              obscure: false,
              type: TextInputType.text,
              // hint: "Insira o número da placa",
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
