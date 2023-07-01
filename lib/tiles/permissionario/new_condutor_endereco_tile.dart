import 'package:brasil_fields/brasil_fields.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_dropdown.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewCondutorEnderecoTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  NewCondutorEnderecoTile(this._globalKey);

  @override
  _NewCondutorEnderecoTileState createState() =>
      _NewCondutorEnderecoTileState(_globalKey);
}

class _NewCondutorEnderecoTileState extends State<NewCondutorEnderecoTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _NewCondutorEnderecoTileState(this._scaffoldKey);

  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _numController = TextEditingController();
  final _complementController = TextEditingController();
  final _bairroController = TextEditingController();
  final _municipioController = TextEditingController();
  String _uf = "";
  String _image = "";

  @override
  void initState() {
    super.initState();
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    super.dispose();

    _cepController.dispose();
    _addressController.dispose();
    _numController.dispose();
    _complementController.dispose();
    _bairroController.dispose();
    _municipioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;

      _cepController.text = condutorStore.solicitacaoDeAlteracao?.campo8 ?? '';
      _addressController.text =
          condutorStore.solicitacaoDeAlteracao?.campo9 ?? '';
      _numController.text = condutorStore.solicitacaoDeAlteracao?.campo10 ?? '';
      _complementController.text =
          condutorStore.solicitacaoDeAlteracao?.campo11 ?? '';
      _bairroController.text =
          condutorStore.solicitacaoDeAlteracao?.campo12 ?? '';
      _municipioController.text =
          condutorStore.solicitacaoDeAlteracao?.campo13 ?? '';
      _uf = condutorStore.solicitacaoDeAlteracao?.campo14 ?? '';
      _image = condutorStore.solicitacaoDeAlteracao?.arquivo2 ?? '';
    }

    return Container(
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _cepController,
                            label: "CEP",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateCEP,
                            hint: "CEP",
                            inputFormatters: [CepInputFormatter()],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _addressController,
                            label: "ENDEREÇO",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
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
                          child: CustomInputFieldGrey(
                            controller: _numController,
                            label: "NÚMERO",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateNumber,
                            hint: "NÚMERO",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _complementController,
                            label: "COMPLEMENTO",
                            type: TextInputType.text,
                            hint: "COMPLEMENTO",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _bairroController,
                      label: "BAIRRO",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "BAIRRO",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _municipioController,
                            label: "MUNICÍPIO",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "MUNICÍPIO",
                          ),
                        ),
                        Spacer(),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: CustomDropdown(
                              dropdownValues: Util.UFs,
                              hint: Text("UF"),
                              value: _uf,
                              onChanged: (newValue) {
                                setState(() {
                                  _uf = newValue;
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: _image,
                      text: "Comprovante do Endereço",
                      callBack: (String imgPath) {
                        _image = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            condutorStore.saveAbaEnderecoNewCondutor(
                                cep: Util.clearString(_cepController.text),
                                endereco: _addressController.text,
                                complemento: _complementController.text,
                                bairro: _bairroController.text,
                                numero: _numController.text,
                                municipio: _municipioController.text,
                                uf: _uf,
                                imgComprovanteEndereco: _image,
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
