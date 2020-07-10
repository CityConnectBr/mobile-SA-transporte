
import 'package:cityconnect/screen/home_screen.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTile extends StatefulWidget {
  @override
  _LoginTileState createState() => _LoginTileState();
}

class _LoginTileState extends State<LoginTile> {

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          Text("Seja bem vindo, \nFiscal",
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
              ),
              SizedBox(
                height: 26.0,
              ),
              CustomRaisedButtonBlue(label: "Login", func: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())
                );
              }),
              SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Esqueceu a sua senha?",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
