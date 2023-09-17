import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
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

class NewCondutorTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  NewCondutorTile(this._globalKey);

  @override
  _NewCondutorTileState createState() => _NewCondutorTileState(_globalKey);
}

class _NewCondutorTileState extends State<NewCondutorTile> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  final _dddController = TextEditingController();
  final _phoneController = TextEditingController();
  final _celController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnhController = TextEditingController();
  final _vencimentoCNHController = TextEditingController();
  String _categoriaCNH = '';
  String _imageCNH = '';

  bool _flagIsLoad = false;
  bool _flagCelular = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _NewCondutorTileState(this._scaffoldKey);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _dddController.dispose();
    _phoneController.dispose();
    _celController.dispose();
    _emailController.dispose();
    _cnhController.dispose();
    _vencimentoCNHController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;
      _nomeController.text =
          condutorStore.solicitacaoDeAlteracao?.campo15 ?? '';
      _cpfController.text =
          Util.clearString(condutorStore.solicitacaoDeAlteracao?.campo16);
      _rgController.text = condutorStore.solicitacaoDeAlteracao?.campo17 ?? '';
      _dddController.text = condutorStore.solicitacaoDeAlteracao?.campo5 ?? '';
      _phoneController.text =
          condutorStore.solicitacaoDeAlteracao?.campo6 ?? '';
      _celController.text = condutorStore.solicitacaoDeAlteracao?.campo7 ?? '';
      _emailController.text =
          condutorStore.solicitacaoDeAlteracao?.campo4 ?? '';
      _cnhController.text = condutorStore.solicitacaoDeAlteracao?.campo1 ?? '';
      _categoriaCNH = condutorStore.solicitacaoDeAlteracao?.campo2 ?? '';
      _vencimentoCNHController.text =
          condutorStore.solicitacaoDeAlteracao?.campo3 != null
              ? Util.convertyyyyMMddToddMMyyyy(
                  condutorStore.solicitacaoDeAlteracao!.campo3!)
              : '';
      _imageCNH = condutorStore.solicitacaoDeAlteracao?.arquivo1 ?? '';
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
                        Text(
                          'Dados de Contato',
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
                      controller: _emailController,
                      label: "E-MAIL",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateEmail,
                      hint: "E-MAIL",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _dddController,
                            label: "DDD",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateDDD,
                            hint: "DDD",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _phoneController,
                            label: "TELEFONE",
                            type: TextInputType.number,
                            hint: "TELEFONE",
                            validator: ValidatorsUtil.validatePhone,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _celController,
                      label: "CELULAR",
                      type: TextInputType.text,
                      hint: "CELULAR",
                      validator: ValidatorsUtil.validatePhone,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Dados de Identidade",
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
                      controller: _nomeController,
                      label: "NOME",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "NOME",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _cpfController,
                            label: "CPF",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateCPF,
                            hint: "CPF",
                            inputFormatters: [
                              // obrigatório
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter()
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _rgController,
                            label: "RG",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "RG",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
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
                      validator: ValidatorsUtil.caracteres11,
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
                            value: _categoriaCNH,
                            onChanged: (newValue) {
                              setState(() {
                                _categoriaCNH = newValue;
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
                            type: TextInputType.number,
                            hint: "VENCIMENTO",
                            validator: ValidatorsUtil.validateDate,
                            inputFormatters: [
                              // obrigatório
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter()
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: _imageCNH,
                      text: "Comprovante de CNH",
                      callBack: (String imgPath) {
                        _imageCNH = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            condutorStore.saveAbaDadosNewCondutor(
                                nome: _nomeController.text,
                                email: _emailController.text,
                                cpf: Util.clearString(_cpfController.text),
                                ddd: _dddController.text,
                                celular: Util.clearString(_celController.text),
                                rg: _rgController.text,
                                telefone:
                                    Util.clearString(_phoneController.text),
                                vencimentoCNH: Util.dateFormatddMMyyyy
                                    .parse(_vencimentoCNHController.text),
                                cnh: _cnhController.text,
                                categoriaCNH: _categoriaCNH,
                                imgComprovanteCNH: _imageCNH,
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
