import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class EditAddressTile extends StatefulWidget {
  @override
  _EditAddressTileState createState() => _EditAddressTileState();
}

class _EditAddressTileState extends State<EditAddressTile> {
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _numController = TextEditingController();
  final _complementController = TextEditingController();
  final _bairroController = TextEditingController();
  final _municipioController = TextEditingController();
  final _ufController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _cepController.dispose();
    _addressController.dispose();
    _numController.dispose();
    _complementController.dispose();
    _bairroController.dispose();
    _municipioController.dispose();
    _ufController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _cepController,
                        label: "CEP",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "CEP",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _addressController,
                        label: "ENDEREÇO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "ENDEREÇO",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _numController,
                        label: "NÚMERO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "NÚMERO",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _complementController,
                        label: "COMPLEMENTO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "COMPLEMENTO",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomFormInputField(
                  controller: _bairroController,
                  label: "BAIRRO",
                  obscure: false,
                  type: TextInputType.emailAddress,
                  hint: "BAIRRO",
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _municipioController,
                        label: "MUNICÍPIO",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "MUNICÍPIO",
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: CustomFormInputField(
                        controller: _ufController,
                        label: "UF",
                        obscure: false,
                        type: TextInputType.text,
                        hint: "UF",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 26.0,
                ),
                CustomRaisedButtonBlue(
                    label: "Salvar",
                    func: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkBoxChange(bool novoValor) {
    // setState(() {
    //   this._termoAceito = novoValor;
    // });
  }
}
