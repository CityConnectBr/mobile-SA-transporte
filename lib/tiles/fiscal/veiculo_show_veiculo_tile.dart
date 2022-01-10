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

class VeiculoShowVeiculoTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  final Veiculo _veiculo;

  VeiculoShowVeiculoTile(this._globalKey, this._veiculo);

  @override
  _VeiculoShowVeiculoTileState createState() =>
      _VeiculoShowVeiculoTileState(_globalKey, this._veiculo);
}

class _VeiculoShowVeiculoTileState extends State<VeiculoShowVeiculoTile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Veiculo _veiculo;

  _VeiculoShowVeiculoTileState(this._scaffoldKey, this._veiculo);

  final _placaController = TextEditingController();
  final _renavanController = TextEditingController();
  final _chassiController = TextEditingController();
  final _anoDeFabricacaoController = TextEditingController();
  final _anoDoModeloController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _tipoDaCapacidadeController = TextEditingController();
  final _observacaoDaCapacidadeController = TextEditingController();
  final _anosDeVidaUtilDoVeiculoController = TextEditingController();
  final _marcaModeloVeiculoController = TextEditingController();
  final _tipoCombustivelController = TextEditingController();
  final _corController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool _flagIsLoad = false;

  @override
  void dispose() {
    super.dispose();

    _placaController.dispose();
    _renavanController.dispose();
    _chassiController.dispose();
    _anoDeFabricacaoController.dispose();
    _anoDoModeloController.dispose();
    _capacidadeController.dispose();
    _tipoDaCapacidadeController.dispose();
    _observacaoDaCapacidadeController.dispose();
    _anosDeVidaUtilDoVeiculoController.dispose();
    _marcaModeloVeiculoController.dispose();
    _tipoCombustivelController.dispose();
    _corController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore veiculoStore = Provider.of<VeiculoStore>(context);

    if (!this._flagIsLoad && this._veiculo != null) {
      this._flagIsLoad = true;

      _placaController.text = this._veiculo.placa;
      _renavanController.text = this._veiculo.renavam;
      _chassiController.text = this._veiculo.chassi;
      _anoDeFabricacaoController.text = this._veiculo.anoDeFabricacao != null
          ? this._veiculo.anoDeFabricacao.toString()
          : "";
      _anoDoModeloController.text = this._veiculo.anoDoModelo != null
          ? this._veiculo.anoDoModelo.toString()
          : "";
      _capacidadeController.text = this._veiculo.capacidade;
      _tipoDaCapacidadeController.text = this._veiculo.tipoDaCapacidade;
      _observacaoDaCapacidadeController.text =
          this._veiculo.observacaoDaCapacidade;
      _anosDeVidaUtilDoVeiculoController.text =
      this._veiculo.anosDeVidaUtilDoVeiculo != null
          ? this._veiculo.anosDeVidaUtilDoVeiculo.toString()
          : "";
      _marcaModeloVeiculoController.text =
      this._veiculo.marcaModeloVeiculo != null
          ? this._veiculo.marcaModeloVeiculo.descricao
          : "";
      _tipoCombustivelController.text = this._veiculo.tipoCombustivel != null
          ? this._veiculo.tipoCombustivel.descricao
          : "";
      _corController.text = this._veiculo.corVeiculo != null
          ? this._veiculo.corVeiculo.descricao
          : "";
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
            "Dados do Veículo",
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
              controller: _placaController,
              label: "PLACA",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _renavanController,
              label: "RENAVAN",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _chassiController,
              label: "CHASSI",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _anoDeFabricacaoController,
              label: "ANO DE FABRICACAO",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _anoDoModeloController,
              label: "ANO DO MODELO",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _capacidadeController,
              label: "CAPACIDADE",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _tipoDaCapacidadeController,
              label: "TIPO DA CAPACIDADE:",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _observacaoDaCapacidadeController,
              label: "OBSERVAÇÃO DA CAPACIDADE",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _anosDeVidaUtilDoVeiculoController,
              label: "ANOS DE VIDA",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _marcaModeloVeiculoController,
              label: "MARCA MODELO",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _tipoCombustivelController,
              label: "TIPO DE COMBUSTIVEL",
              obscure: false,
              type: TextInputType.text,
              enabled: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomInputFieldGrey(
              controller: _corController,
              label: "COR",
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
