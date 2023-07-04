import 'package:brasil_fields/brasil_fields.dart';
import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/condutor_dados_cnh_edit_screen.dart';
import 'package:sa_transportes_mobile/screen/permissionario/condutor_dados_identidade_edit_screen.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/screen/permissionario/condutor_dados_contato_edit_screen.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorEditDadosTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Condutor _condutor;

  CondutorEditDadosTile(this._globalKey, this._condutor);

  @override
  _CondutorEditDadosTileState createState() =>
      _CondutorEditDadosTileState(_globalKey, _condutor);
}

class _CondutorEditDadosTileState extends State<CondutorEditDadosTile> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  final _dddController = TextEditingController();
  final _phoneController = TextEditingController();
  final _celController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnhCategoriaController = TextEditingController();
  final _cnhController = TextEditingController();
  final _vencimentoCNHController = TextEditingController();

  bool _flagCelular = true;
  bool _flagIsLoad = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Condutor _condutor;

  _CondutorEditDadosTileState(this._scaffoldKey, this._condutor);

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
    _cnhCategoriaController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;
      _nomeController.text = _condutor.nome??'';
      _cpfController.text = Util.clearString(_condutor.cpf??'');
      _rgController.text = _condutor.rg??'';
      _dddController.text = _condutor.ddd??'';
      _phoneController.text = _condutor.telefone??'';
      _celController.text = _condutor.celular??'';
      _emailController.text = _condutor.email??'';
      _cnhController.text = _condutor.cnh??'';
      _vencimentoCNHController.text = _condutor.vencimentoCNH != null
          ? Util.dateFormatddMMyyyy.format(_condutor.vencimentoCNH!)
          : '';
      _cnhCategoriaController.text = _condutor.categoriaCNH??'';
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
                        condutorStore.editCondutor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService
                                .TIPO_CONDUTOR_CONTATO,
                            screenToOpen: CondutorDadosContatoScreen());
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
                                  inputFormatters: [], //TODO: Adicionar máscara
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
                                  inputFormatters: [TelefoneInputFormatter()],
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
                            inputFormatters: [TelefoneInputFormatter()],
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
                        condutorStore.editCondutor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao: SolicitacaoDeAlteracaoService
                                .TIPO_CONDUTOR_IDENTIDADE,
                            screenToOpen: CondutorDadoIsdentidadeScreen());
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
                    SizedBox(
                      height: 32.0,
                    ),
                    CardEditFieldsTile(
                      title: "Dados de CNH",
                      voidCallback: () {
                        condutorStore.editCondutor(
                            context: context,
                            scaffoldKey: _scaffoldKey,
                            tipoDaSolicitacao:
                                SolicitacaoDeAlteracaoService.TIPO_CONDUTOR_CNH,
                            screenToOpen: CondutorDadosCnhScreen());
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
                                    inputFormatters: [DataInputFormatter()]),
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
