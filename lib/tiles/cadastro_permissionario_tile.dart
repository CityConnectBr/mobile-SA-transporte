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
  final _prefixoController = TextEditingController();
  final _permissionarioController = TextEditingController();
  final _validadeCNHController = TextEditingController();
  final _localController = TextEditingController();
  final _pontoController = TextEditingController();
  final _cnhController = TextEditingController();
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
                    controller: _prefixoController,
                    label: "Prefixo:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _permissionarioController,
                    label: "Permissionário:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _localController,
                    label: "Local:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _pontoController,
                    label: "Nº Ponto:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _cnhController,
                    label: "CNH Reg:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _validadeCNHController,
                    label: "Validade/CNH:",
                    obscure: false,
                    type: TextInputType.text,
                    validator: ValidatorsUtil.validateDate,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _fiscalizacaoController,
                    label: "Ass./Ger. Fiscalização Operacional:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtonYellow(
                      label: "Associar Veículo",
                      func: () {
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //    builder: (context) => HomeScreen()));
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Cadastrar Permissionário",
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
