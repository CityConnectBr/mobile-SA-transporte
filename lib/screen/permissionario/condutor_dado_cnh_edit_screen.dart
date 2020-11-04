import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/util/validators.dart';
import 'package:cityconnect/widgets/custom_dialog.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadoCnhScreen extends StatefulWidget {
  final Condutor _condutor;

  CondutorDadoCnhScreen(this._condutor);

  @override
  _CondutorDadoCnhScreenState createState() =>
      _CondutorDadoCnhScreenState(this._condutor);
}

class _CondutorDadoCnhScreenState extends State<CondutorDadoCnhScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Condutor _condutor;
  String _image;
  final picker = ImagePicker();

  _CondutorDadoCnhScreenState(this._condutor);

  final _cnhController = TextEditingController();
  final _vencimentoCNHController =
      MaskedTextController(mask: MaskUtil.dateMask);
  String _categoriaCNH;

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagIsLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _cnhController.dispose();
    _vencimentoCNHController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _cnhController.text = this._condutor.cnh;
      _categoriaCNH = this._condutor.categoriaCNH;
      _vencimentoCNHController.text = this._condutor.vencimentoCNH != null
          ? this._dateFormat.format(this._condutor.vencimentoCNH)
          : null;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados CNH",
          style: TextStyle(
            fontFamily: "InterBold",
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Observer(builder: (_) {
              if (condutorStore.loading)
                return Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Dados de CNH",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _cnhController,
                            label: "CNH",
                            type: TextInputType.number,
                            validator:
                                ValidatorsUtil.validateNumberAndNotIsEmpty,
                            hint: "CNH",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomDropdown(
                                  dropdownValues: const <String>[
                                    'A',
                                    'AB',
                                    'AC',
                                    'AD',
                                    'AE',
                                    'B',
                                    'C',
                                    'D',
                                    'E'
                                  ],
                                  hint: Text("CATEGORIA"),
                                  value: this._categoriaCNH,
                                  onChanged: (newValue) {
                                    setState(() {
                                      this._categoriaCNH = newValue;
                                    });
                                  },
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _vencimentoCNHController,
                                  label: "VENCIMENTO",
                                  type: TextInputType.text,
                                  hint: "VENCIMENTO",
                                  validator: ValidatorsUtil.validateDate,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: _image != null ?

                              Image.asset(
                                "${_image}",
                                height: 140,
                                fit: BoxFit.contain,
                              ) : Text(
                                "Nenhuma imagem selecionada",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            onTap: () async {
                              final pickedFile = await picker.getImage(source: ImageSource.camera);



                              setState(() {

                                if (pickedFile != null) {
                                  print(pickedFile.path);
                                  _image = pickedFile.path;
                                  print(_image);
                                } else {
                                  print('No image selected.');
                                }
                              });
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Salvar",
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        condutorStore.save(
                                            vencimentoCNH: this
                                                ._dateFormat
                                                .parse(this
                                                    ._vencimentoCNHController
                                                    .text),
                                            cnh: this._cnhController.text,
                                            categoriaCNH: this._categoriaCNH,
                                            context: context,
                                            scaffoldKey: _scaffoldKey);
                                      },
                                      voidCallbackNao: () {});
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
