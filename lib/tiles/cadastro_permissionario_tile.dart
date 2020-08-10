import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionarioTile extends StatefulWidget {
  @override
  _PermissionarioTileState createState() => _PermissionarioTileState();
}

class _PermissionarioTileState extends State<PermissionarioTile> {
  final _nomeController = TextEditingController();
  final _localController = TextEditingController();
  final _pontosController = TextEditingController();
  final _cnhController = TextEditingController();
  final _cnhValidadeController = TextEditingController();
  final _prefixoController = TextEditingController();
  final _fiscalizacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  CustomFormInputField(
                    controller: _nomeController,
                    label: "Nome",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _localController,
                    label: "Local",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _pontosController,
                    label: "Nº Pontos",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _cnhController,
                    label: "CNH",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _cnhValidadeController,
                    label: "Validade CNH",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _prefixoController,
                    label: "Prefixo",
                    obscure: false,
                    type: TextInputType.text,
                    validator: ValidatorsUtil.validateDate,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _fiscalizacaoController,
                    label: "Ger. Fiscalização Operacional:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Associar Veículo",
                      func: () {
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //    builder: (context) => HomeScreen()));
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Finalizar Cadastro",
                      func: () {
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //    builder: (context) => HomeScreen()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
