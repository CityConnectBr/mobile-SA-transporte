import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PermissionarioEditDadosTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  PermissionarioEditDadosTile(this._globalKey);

  @override
  _PermissionarioEditDadosTileState createState() =>
      _PermissionarioEditDadosTileState(_globalKey);
}

class _PermissionarioEditDadosTileState
    extends State<PermissionarioEditDadosTile> {
  final _nomeController = TextEditingController();
  final _documentController = TextEditingController();
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _inscricaoMunicipalController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _dddController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phone2Controller = TextEditingController();
  final _celController = TextEditingController();
  final _emailController = TextEditingController();

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _PermissionarioEditDadosTileState(this._scaffoldKey);

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _documentController.dispose();
    _rgController.dispose();
    _natController.dispose();
    _nacController.dispose();
    _dataNascimentoController.dispose();
    _dddController.dispose();
    _phoneController.dispose();
    _phone2Controller.dispose();
    _celController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;

      _nomeController.text = mainStore.usuario?.permissionario?.nome ?? '';
      _documentController.text =
          mainStore.usuario?.permissionario?.cpfCnpj ?? '';
      _rgController.text = mainStore.usuario?.permissionario?.rg ?? '';
      _natController.text =
          mainStore.usuario?.permissionario?.naturalidade ?? '';
      _nacController.text =
          mainStore.usuario?.permissionario?.nacionalidade ?? '';
      _inscricaoMunicipalController.text =
          mainStore.usuario?.permissionario?.inscricaoMunicipal ?? '';
      _dataNascimentoController.text =
          mainStore.usuario?.permissionario?.dataNascimento != null
              ? _dateFormat
                  .format(mainStore.usuario!.permissionario!.dataNascimento!)
              : '';
      _dddController.text = mainStore.usuario?.permissionario?.ddd ?? '';
      _phoneController.text = mainStore.usuario?.permissionario?.telefone ?? '';
      _phone2Controller.text =
          mainStore.usuario?.permissionario?.telefone2 ?? '';
      _celController.text = mainStore.usuario?.permissionario?.celular ?? '';
      _emailController.text = mainStore.usuario?.permissionario?.email ?? '';
    }

    return Container(
      child: Observer(builder: (_) {
        if (mainStore.loading)
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
                      title: 'Dados de Identidade',
                      voidCallback: () {
                        // monitorStore.editMonitor(
                        //     context: context,
                        //     scaffoldKey: _scaffoldKey,
                        //     tipoDaSolicitacao: SolicitacaoDeAlteracaoService.TIPO_MONITOR_CONTATO,
                        //     screenToOpen: MonitorDadosContatoScreen());
                      },
                      child: Column(
                        children: [
                          CustomInputFieldGrey(
                            controller: _nomeController,
                            label: "NOME",
                            enabled: false,
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
                                  controller: _documentController,
                                  label: "CPF/CNPJ",
                                  enabled: false,
                                  hint: "CPF",
                                  inputFormatters: [
                                    // obrigatório
                                    FilteringTextInputFormatter.digitsOnly,
                                    CpfOuCnpjFormatter()
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _rgController,
                                  label: "RG",
                                  enabled: false,
                                  hint: "RG",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _dataNascimentoController,
                            label: "DATA NASCIMENTO",
                            enabled: false,
                            hint: "DATA NASCIMENTO",
                            inputFormatters: [
                              // obrigatório
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter()
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
                                  controller: _natController,
                                  label: "NATURALIDADE",
                                  enabled: false,
                                  hint: "NATURALIDADE",
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _nacController,
                                  label: "NACIONALIDADE",
                                  enabled: false,
                                  hint: "NACIONALIDADE",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CardEditFieldsTile(
                      title: 'Dados de Contato',
                      voidCallback: () {
                        // monitorStore.editMonitor(
                        //     context: context,
                        //     scaffoldKey: _scaffoldKey,
                        //     tipoDaSolicitacao: SolicitacaoDeAlteracaoService.TIPO_MONITOR_CONTATO,
                        //     screenToOpen: MonitorDadosContatoScreen());
                      },
                      child: Column(
                        children: [
                          CustomInputFieldGrey(
                            controller: _emailController,
                            label: "E-MAIL",
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
                                  enabled: false,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _phoneController,
                                  label: "TELEFONE",
                                  enabled: false,
                                  inputFormatters: [
                                    // obrigatório
                                    FilteringTextInputFormatter.digitsOnly,
                                    TelefoneInputFormatter()
                                  ],
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
                                  controller: _phone2Controller,
                                  label: "TELEFONE 2",
                                  enabled: false,
                                  inputFormatters: [
                                    // obrigatório
                                    FilteringTextInputFormatter.digitsOnly,
                                    TelefoneInputFormatter()
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _celController,
                                  label: "CELULAR",
                                  enabled: false,
                                  inputFormatters: [
                                    // obrigatório
                                    FilteringTextInputFormatter.digitsOnly,
                                    TelefoneInputFormatter()
                                  ],
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
