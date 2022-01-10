import 'package:sa_transportes_mobile/models/veiculo_model.dart';
import 'package:sa_transportes_mobile/screen/fiscal/veiculo_multa_screen.dart';
import 'package:sa_transportes_mobile/screen/fiscal/veiculo_perm_edit_screen.dart';
import 'package:sa_transportes_mobile/services/solicitacao_alteracao_service.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/tiles/card_edit_fields_tile.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_dropdown.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VeiculoShowPermTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Veiculo _veiculo;

  VeiculoShowPermTile(this._globalKey, this._veiculo);

  @override
  _VeiculoShowPermTileState createState() =>
      _VeiculoShowPermTileState(_globalKey, this._veiculo);
}

class _VeiculoShowPermTileState extends State<VeiculoShowPermTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Veiculo _veiculo;

  _VeiculoShowPermTileState(this._scaffoldKey, this._veiculo);

  final _nomeController = TextEditingController();
  TextEditingController _documentController = MaskedTextController(mask: MaskUtil.cpfMask);
  final _rgController = TextEditingController();
  final _natController = TextEditingController();
  final _nacController = TextEditingController();
  final _inscricaoMunicipalController = TextEditingController();
  final _dataNascimentoController = MaskedTextController(mask: MaskUtil.dateMask);
  final _dddController = MaskedTextController(mask: MaskUtil.dddMask);
  final _phoneController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _phone2Controller = MaskedTextController(mask: MaskUtil.telefone8Mask);
  TextEditingController _celController = MaskedTextController(mask: MaskUtil.telefone8Mask);
  final _emailController = TextEditingController();

  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagCelular = true;


  @override
  void initState() {
    super.initState();
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    super.dispose();

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
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore veiculoStore = Provider.of<VeiculoStore>(context);

    if (!this._flagIsLoad && this._veiculo.permissionario != null) {
      this._flagIsLoad = true;

      _nomeController.text = this._veiculo.permissionario?.nome;
      _documentController.text = this._veiculo.permissionario?.cpfCnpj;
    _rgController.text = this._veiculo.permissionario?.rg;
    _natController.text = this._veiculo.permissionario?.naturalidade;
    _nacController.text = this._veiculo.permissionario?.nacionalidade;
    _inscricaoMunicipalController.text = this._veiculo.permissionario?.inscricaoMunicipal;
    _dataNascimentoController.text = this._veiculo.permissionario?.dataNascimento != null
    ? this._dateFormat.format(this._veiculo.permissionario?.dataNascimento)
        : null;
    _dddController.text = this._veiculo.permissionario?.ddd;
    _phoneController.text = this._veiculo.permissionario?.telefone;
    _phone2Controller.text = this._veiculo.permissionario?.telefone2;
    _celController.text = this._veiculo.permissionario?.celular;
    _emailController.text = this._veiculo.permissionario?.email;
    }

    return Container(
      child: Observer(builder: (_) {
        if (veiculoStore.loading)
          return Container(
            margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        return Container(
          padding: EdgeInsets.fromLTRB(20.0 , 0.0, 20.0, 20.0),
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Text(
                      "Dados do Permissionário",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 70),
                  ]),
              Column(
                children: <Widget>[
                  CustomInputFieldGrey(
                    controller: _nomeController,
                    label: "NOME",
                    obscure: false,
                    type: TextInputType.text,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _documentController,
                    label: "DOCUMENTO",
                    obscure: false,
                    type: TextInputType.text,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _rgController,
                    label: "RG",
                    obscure: false,
                    type: TextInputType.text,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _inscricaoMunicipalController,
                    label: "INSCRIÇÃO MUNICIPAL",
                    obscure: false,
                    type: TextInputType.text,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomInputFieldGrey(
                    controller: _phoneController,
                    label: "TELEFONE",
                    obscure: false,
                    type: TextInputType.text,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtonBlue(label: "Multar", func: () {
                    veiculoStore.solicitarMulta(
                        context: context,
                        scaffoldKey: _scaffoldKey,
                        tipoDaSolicitacao: SolicitacaoDeAlteracaoService.TIPO_FISCAL_MULTA,
                        screenToOpen: VeiculoMultaScreen(this._veiculo));
                  }),
                ],
              )],
          ),
        );
        // return Container(
        //   padding: EdgeInsets.all(20.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Form(
        //         key: _formKey,
        //         child: Column(
        //           children: <Widget>[
        //             Row(children: <Widget>[
        //               Text(
        //                 "Dados do Veículo",
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                   fontSize: 22.0,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               SizedBox(height: 70),
        //             ]),
        //             Column(
        //               children: [
        //                 Row(
        //                   children: <Widget>[
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _cepController,
        //                         label: "CEP",
        //                         hint: "CEP",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                     Spacer(),
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _addressController,
        //                         label: "ENDEREÇO",
        //                         hint: "ENDEREÇO",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 16.0,
        //                 ),
        //                 Row(
        //                   children: <Widget>[
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _numController,
        //                         label: "NÚMERO",
        //                         hint: "NÚMERO",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                     Spacer(),
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _complementController,
        //                         label: "COMPLEMENTO",
        //                         hint: "COMPLEMENTO",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 16.0,
        //                 ),
        //                 CustomInputFieldGrey(
        //                   controller: _bairroController,
        //                   label: "BAIRRO",
        //                   hint: "BAIRRO",
        //                   enabled: false,
        //                 ),
        //                 SizedBox(
        //                   height: 16.0,
        //                 ),
        //                 Row(
        //                   children: <Widget>[
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _municipioController,
        //                         label: "MUNICÍPIO",
        //                         hint: "MUNICÍPIO",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                     Spacer(),
        //                     Container(
        //                       width: MediaQuery.of(context).size.width * 0.43,
        //                       child: CustomInputFieldGrey(
        //                         controller: _ufController,
        //                         label: "UF",
        //                         hint: "UF",
        //                         enabled: false,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      }),
    );
  }
}
