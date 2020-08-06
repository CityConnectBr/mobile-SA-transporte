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
              label: "Buscar motorista",
              obscure: false,
              type: TextInputType.text,
              // hint: "Insira o número da placa",
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 8.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "images/icon_search.png",
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
