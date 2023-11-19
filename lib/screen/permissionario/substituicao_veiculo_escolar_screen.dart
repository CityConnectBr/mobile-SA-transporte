import 'package:sa_transportes_mobile/stores/permissionario/subistituicao_veiculo_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubstituicaoVeiculoEscolarScreen extends StatefulWidget {
  final int veiculoId;

  SubstituicaoVeiculoEscolarScreen({required this.veiculoId});

  @override
  _SubstituicaoVeiculoEscolarScreenState createState() =>
      _SubstituicaoVeiculoEscolarScreenState(veiculoId: this.veiculoId);
}

class _SubstituicaoVeiculoEscolarScreenState
    extends State<SubstituicaoVeiculoEscolarScreen>
    with SingleTickerProviderStateMixin {
  final int veiculoId;

  _SubstituicaoVeiculoEscolarScreenState({required this.veiculoId});

  String? _fotoVeiculo;
  String? _fotoIPVA;
  String? _fotoCRLV;
  String? _fotoLaudoTacografo;
  String? _fotoAutorizacaoCIRETRAN;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SubstituicaoVeiculoStore _store =
        Provider.of<SubstituicaoVeiculoStore>(context);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Solicitação de Substituição de Veículo',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomImagePickerField(
                      imagePath: this._fotoVeiculo,
                      text: "Foto do Veículo",
                      callBack: (String imgPath) {
                        this._fotoVeiculo = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._fotoIPVA,
                      text: "Foto do IPVA",
                      callBack: (String imgPath) {
                        this._fotoIPVA = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._fotoCRLV,
                      text: "Foto do CRLV",
                      callBack: (String imgPath) {
                        this._fotoCRLV = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._fotoLaudoTacografo,
                      text: "Foto do Laudo Tacógrafo",
                      callBack: (String imgPath) {
                        this._fotoLaudoTacografo = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._fotoAutorizacaoCIRETRAN,
                      text: "Foto da Autorização do CIRETRAN",
                      callBack: (String imgPath) {
                        this._fotoAutorizacaoCIRETRAN = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            _store.solicitarSubstituicaoVeiculoEscolar(
                                veiculoId: this.veiculoId.toString(),
                                fotoVeiculo: this._fotoVeiculo,
                                fotoIPVA: this._fotoIPVA,
                                fotoCRLV: this._fotoCRLV,
                                fotoLaudoTacografo: this._fotoLaudoTacografo,
                                fotoAutorizacaoCIRETRAN:
                                    this._fotoAutorizacaoCIRETRAN,
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        }),
                  ],
                )),
          ),
        ));
  }
}
