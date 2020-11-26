import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/screen/permissionario/condutor_dados_cnh_edit_screen.dart';
import 'package:cityconnect/screen/permissionario/condutor_dados_identidade_edit_screen.dart';
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/screen/permissionario/condutor_dados_contato_edit_screen.dart';
import 'package:cityconnect/tiles/card_edit_fields_tile.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorEditDadosTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Condutor _condutor;

  CondutorEditDadosTile(this._globalKey, this._condutor);

  @override
  _CondutorEditDadosTileState createState() => _CondutorEditDadosTileState(_globalKey, this._condutor);
}

class _CondutorEditDadosTileState extends State<CondutorEditDadosTile> {
  final _nomeController = TextEditingController();
  TextEditingController _cpfController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();
  final _cnhCategoriaController = TextEditingController();
  final _cnhController = TextEditingController();
  final _vencimentoCNHController = MaskedTextController(mask: MaskUtil.dateMask);

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Condutor _condutor;

  _CondutorEditDadosTileState(this._scaffoldKey, this._condutor);

  void _controllerMaskCelular(String valor) {
    if (valor.length > 9 && _flagCelular) {
      _flagCelular = false;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone9Mask, value: valor);
      });
    } else if (valor.length <= 9 && !_flagCelular) {
      _flagCelular = true;
      setState(() {
        _celController = MaskUtil.getMaskControllerWithValue(mask: MaskUtil.telefone8Mask, value: valor);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _dddController.dispose();
    _phoneController.dispose();
    _celController.dispose();
    _emailController.dispose();
    _cnhController.dispose();
    _vencimentoCNHController.dispose();
    _cnhCategoriaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      _nomeController.text = this._condutor.nome;
      _cpfController.text = Util.clearString(this._condutor.cpf);
      _rgController.text = this._condutor.rg;
      _dddController.text = this._condutor.ddd;
      _phoneController.text = this._condutor.telefone;
      _celController.text = this._condutor.celular;
      _emailController.text = this._condutor.email;
      _cnhController.text = this._condutor.cnh;
      _vencimentoCNHController.text = this._condutor.vencimentoCNH != null ? Util.dateFormatddMMyyyy.format(this._condutor.vencimentoCNH) : null;
      _cnhCategoriaController.text = this._condutor.categoriaCNH;
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
                    CardEditFieldsTile(
                      title: 'Dados de Contato',
                      voidCallback: () {
                        condutorStore.editContatoCondutor(context: context, scaffoldKey: _scaffoldKey);
                      },
                      child: Column(
                        children: [
                          CustomInputFieldGrey(
                            controller: _emailController,
                            label: "E-MAIL",
                            hint: "E-MAIL",
                            enabled: false,
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
                                  hint: "DDD",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _phoneController,
                                  label: "TELEFONE",
                                  hint: "TELEFONE",
                                  enabled: false,
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
                            hint: "CELULAR",
                            enabled: false,
                            onChanged: _controllerMaskCelular,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CardEditFieldsTile(
                      title: "Dados de Identidade",
                      voidCallback: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorDadoIsdentidadeScreen(Condutor())));
                      },
                      child: Column(
                        children: [
                          CustomInputFieldGrey(
                            controller: _nomeController,
                            label: "NOME",
                            hint: "NOME",
                            enabled: false,
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
                                  hint: "CPF",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _rgController,
                                  label: "RG",
                                  hint: "RG",
                                  enabled: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CardEditFieldsTile(
                      title: "Dados de CNH",
                      voidCallback: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CondutorDadoIsdentidadeScreen(Condutor())));
                      },
                      child: Column(
                        children: [
                          CustomInputFieldGrey(
                            controller: _cnhController,
                            label: "CNH",
                            hint: "CNH",
                            enabled: false,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _cnhCategoriaController,
                                  label: "CATEGORIA",
                                  hint: "CATEGORIA",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _vencimentoCNHController,
                                  label: "VENCIMENTO",
                                  hint: "VENCIMENTO",
                                  enabled: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
