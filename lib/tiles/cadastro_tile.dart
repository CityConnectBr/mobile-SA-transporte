
import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroTile extends StatefulWidget {
  @override
  _CadastroTileState createState() => _CadastroTileState();
}

class _CadastroTileState extends State<CadastroTile> {

  bool _termoAceito = false;

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _senhaController.dispose();
    _senhaConfirmacaoController.dispose();
    //_tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Novo por aqui?",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0 ),
          ),
          SizedBox(height: 16.0,),
          Form(child:
          Column(
            children: <Widget>[
              CustomFormInputField(
                controller: _emailController,
                label: "E-mail",
                obscure: false,
                type: TextInputType.emailAddress,
                validator: ValidatorsUtil.validateEmail,
                hint: "Seu endereço de e-mail aqui",
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomFormInputField(
                controller: _senhaController,
                label: "Senha",
                obscure: true,
                type: TextInputType.text,
                hint: "Sua senha aqui",
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomFormInputField(
                controller: _senhaConfirmacaoController,
                label: "Confirmação de senha",
                obscure: true,
                type: TextInputType.text,
                hint: "Repita a sua senha",
              ),
              SizedBox(
                height: 26.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: this._termoAceito,
                    onChanged: _checkBoxChange,
                    checkColor: Theme.of(context).primaryColor,
                  ),
                  Text("Aceito termos de uso")
                ],
              ),
              GestureDetector(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Ler termo de uso",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 26.0,
              ),
              CustomRaisedButtonBlue(label: "Cadastro", func: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())
                );
              }),
            ],
          ),
          ),
        ],
      ),
    );
  }

  void _checkBoxChange(bool novoValor){
    setState(() {
      this._termoAceito = novoValor;
    });
  }

}
