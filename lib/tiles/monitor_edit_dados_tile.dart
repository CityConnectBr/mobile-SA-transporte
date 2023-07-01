import 'package:brasil_fields/brasil_fields.dart';
import 'package:sa_transportes_mobile/models/monitor_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/monitor_dados_contato_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/monitor_dados_identidade_edit_screen.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MonitorEditDadosTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Monitor _monitor;

  MonitorEditDadosTile(this._globalKey, this._monitor);

  @override
  _MonitorEditDadosTileState createState() =>
      _MonitorEditDadosTileState(_globalKey, _monitor);
}

class _MonitorEditDadosTileState extends State<MonitorEditDadosTile> {
  final _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dataNascController = TextEditingController();

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Monitor _monitor;

  _MonitorEditDadosTileState(this._scaffoldKey, this._monitor);

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
    _phoneController.dispose();
    _emailController.dispose();
    _dataNascController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;
      _nomeController.text = _monitor?.nome ?? '';
      _cpfController.text = Util.clearString(_monitor?.cpf ?? '');
      _rgController.text = _monitor?.rg ?? '';
      _phoneController.text = _monitor?.telefone ?? '';
      _emailController.text = _monitor?.email ?? '';
      _dataNascController.text = _monitor.dataNascimento != null
          ? Util.dateFormatddMMyyyy.format(_monitor.dataNascimento!)
          : '';
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
                      title: 'Dados de Contato',
                      voidCallback: () {
                        monitorStore.editMonitor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService
                                .TIPO_MONITOR_CONTATO,
                            screenToOpen: MonitorDadosContatoScreen());
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
                          CustomInputFieldGrey(
                            controller: _phoneController,
                            label: "TELEFONE",
                            hint: "TELEFONE",
                            inputFormatters: [TelefoneInputFormatter()],
                            enabled: false,
                          ),
                          SizedBox(
                            height: 16.0,
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
                        monitorStore.editMonitor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService
                                .TIPO_MONITOR_IDENTIDADE,
                            screenToOpen: MonitorDadoIsdentidadeScreen());
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
                                  inputFormatters: [CpfInputFormatter()],
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
