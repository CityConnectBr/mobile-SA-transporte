import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _textStyleTitleBar = TextStyle(color: Util.hexToColor("#505050"), fontSize: 20.0);

  bool _termoAceito = false;

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmacaoController = TextEditingController();

  TabController _tabController;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 160.0,
              // height: double.infinity,
              child: Container(
                padding: EdgeInsets.all(45.0),
                color: Theme.of(context).primaryColor,
                child: Image.asset(
                  "images/logo.png",
                  //width: 50,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(tabs: [
                Tab(child: Text("Login", style: _textStyleTitleBar,),),
                Tab(child: Text("Cadastro", style: _textStyleTitleBar,),),
              ],
                indicatorWeight: 5.0,
                indicatorColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 500.0,
              child: TabBarView(children: [
                Container(
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
                                  MaterialPageRoute(builder: (context) => LoginScreen())
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
                ),
                //////////////////////
                Container(
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
                                MaterialPageRoute(builder: (context) => LoginScreen())
                            );
                          }),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _checkBoxChange(bool novoValor){
    setState(() {
      this._termoAceito = novoValor;
    });
  }

  void _onSuccess() {
//    Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => LoginP2Screen()));
  }

  /*void _onMessage(String message) {
    SnackMessages.showSnackBar(context, _scaffoldKey, message);
  }*/

  void _onFail(String error) {
    SnackMessages.showSnackBarError(context, _scaffoldKey, error);
  }
}
