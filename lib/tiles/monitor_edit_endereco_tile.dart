import 'package:cityconnect/models/monitor_model.dart';
import 'package:cityconnect/screen/permissionario/monitor_dados_endereco_edit_screen.dart';
import 'package:cityconnect/services/solicitacao_alteracao_service.dart';
import 'package:cityconnect/stores/permissionario/monitor_store.dart';
import 'package:cityconnect/tiles/card_edit_fields_tile.dart';
import 'package:cityconnect/util/mask_util.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MonitorEditEnderecoTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Monitor _monitor;

  MonitorEditEnderecoTile(this._globalKey, this._monitor);

  @override
  _MonitorEditEnderecoTileState createState() =>
      _MonitorEditEnderecoTileState(_globalKey, this._monitor);
}

class _MonitorEditEnderecoTileState extends State<MonitorEditEnderecoTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Monitor _monitor;

  _MonitorEditEnderecoTileState(this._scaffoldKey, this._monitor);

  final _cepController = MaskedTextController(mask: MaskUtil.cepMask);
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
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    if (!this._flagIsLoad && this._monitor.endereco != null) {
      this._flagIsLoad = true;

      _cepController.text = this._monitor.endereco.cep;
      _addressController.text = this._monitor.endereco.endereco;
      _numController.text = this._monitor.endereco.numero;
      _complementController.text = this._monitor.endereco.complemento;
      _bairroController.text = this._monitor.endereco.bairro;
      _municipioController.text = this._monitor.endereco.municipio;
      _ufController.text = this._monitor.endereco.uf;
    }

    return Container(
      child: Observer(builder: (_) {
        if (monitorStore.loading)
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
                        monitorStore.editMonitor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService.TIPO_MONITOR_ENDERECO,
                            screenToOpen: MonitorDadosEnderecoScreen());
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
