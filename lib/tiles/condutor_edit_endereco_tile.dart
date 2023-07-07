import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/condutor_dados_endereco_edit_screen.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorEditEnderecoTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Condutor _condutor;

  CondutorEditEnderecoTile(this._globalKey, this._condutor);

  @override
  _CondutorEditEnderecoTileState createState() =>
      _CondutorEditEnderecoTileState(_globalKey, _condutor);
}

class _CondutorEditEnderecoTileState extends State<CondutorEditEnderecoTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Condutor _condutor;

  _CondutorEditEnderecoTileState(this._scaffoldKey, this._condutor);

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
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    _cepController.dispose();
    _addressController.dispose();
    _numController.dispose();
    _complementController.dispose();
    _bairroController.dispose();
    _municipioController.dispose();
    _ufController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!_flagIsLoad && _condutor.endereco != null) {
      _flagIsLoad = true;

      _cepController.text = _condutor.endereco?.cep ?? '';
      _addressController.text = _condutor.endereco?.endereco ?? '';
      _numController.text = _condutor.endereco?.numero ?? '';
      _complementController.text = _condutor.endereco?.complemento ?? '';
      _bairroController.text = _condutor.endereco?.bairro ?? '';
      _municipioController.text = _condutor.endereco?.municipio ?? '';
      _ufController.text = _condutor.endereco?.uf ?? '';
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
                      title: 'Dados de Endereço',
                      voidCallback: () {
                        condutorStore.editCondutor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService
                                .TIPO_CONDUTOR_ENDERECO,
                            screenToOpen: CondutorDadosEnderecoScreen());
                      },
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _cepController,
                                  label: "CEP",
                                  hint: "CEP",
                                  enabled: false,
                                  inputFormatters: [
                                    // obrigatório
                                    FilteringTextInputFormatter.digitsOnly,
                                    CepInputFormatter()
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _addressController,
                                  label: "ENDEREÇO",
                                  hint: "ENDEREÇO",
                                  enabled: false,
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
                                  hint: "NÚMERO",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _complementController,
                                  label: "COMPLEMENTO",
                                  hint: "COMPLEMENTO",
                                  enabled: false,
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
                            hint: "BAIRRO",
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
                                  controller: _municipioController,
                                  label: "MUNICÍPIO",
                                  hint: "MUNICÍPIO",
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _ufController,
                                  label: "UF",
                                  hint: "UF",
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
