import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VeiculoTile extends StatefulWidget {
  @override
  _VeiculoTileState createState() => _VeiculoTileState();
}

class _VeiculoTileState extends State<VeiculoTile> {
  final _veiculoController = TextEditingController();
  final _especieController = TextEditingController();
  final _placaController = TextEditingController();
  final _anoController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _corController = TextEditingController();
  final _taximetroController = TextEditingController();
  final _dataVencimentoController = TextEditingController();
  final _dataEmissaoController = TextEditingController();

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
                    controller: _veiculoController,
                    label: "Veículo/Marca:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _especieController,
                    label: "Espécie/Tipo:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _placaController,
                    label: "Placa:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _anoController,
                    label: "Ano:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _capacidadeController,
                    label: "Capacidade:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _corController,
                    label: "Cor:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _taximetroController,
                    label: "Taxímetro/Tacografo:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _dataVencimentoController,
                    label: "Data de Vencimento:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomFormInputField(
                    controller: _dataEmissaoController,
                    label: "Data de Emissão:",
                    obscure: false,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtonYellow(
                      label: "Associar Motorista",
                      func: () {
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //    builder: (context) => HomeScreen()));
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomRaisedButtonBlue(
                      label: "Cadastrar Veículo",
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
