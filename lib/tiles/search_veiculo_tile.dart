import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatefulWidget {
  @override
  _SearchTileState createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                Container(
                  child: CustomFormInputField(
                    controller: _emailController,
                    label: "Placa do veículo",
                    obscure: false,
                    type: TextInputType.text,
                    hint: "Insira o número da placa",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomRaisedButtonBlue(
                    label: "Buscar Veículo",
                    func: () {
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //    builder: (context) => HomeScreen()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
