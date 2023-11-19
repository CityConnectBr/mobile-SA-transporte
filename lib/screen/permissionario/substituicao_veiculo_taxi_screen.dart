import 'package:sa_transportes_mobile/stores/permissionario/subistituicao_veiculo_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubstituicaoVeiculoTaxiScreen extends StatefulWidget {
  final int veiculoId;

  SubstituicaoVeiculoTaxiScreen({required this.veiculoId});

  @override
  _SubstituicaoVeiculoTaxiScreenState createState() =>
      _SubstituicaoVeiculoTaxiScreenState(veiculoId: this.veiculoId);
}

class _SubstituicaoVeiculoTaxiScreenState
    extends State<SubstituicaoVeiculoTaxiScreen>
    with SingleTickerProviderStateMixin {
  final int veiculoId;

  _SubstituicaoVeiculoTaxiScreenState({required this.veiculoId});

  String? _fotoCRLV;
  String? _fotoComprovanteTaximetroTacografo;
  String? _fotoSeloGas;

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
                      imagePath: this._fotoComprovanteTaximetroTacografo,
                      text:
                          "Foto do Comprovante de Retirada do Taxímetro e Tacógrafo",
                      callBack: (String imgPath) {
                        this._fotoComprovanteTaximetroTacografo = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._fotoSeloGas,
                      text: "Foto do Selo de Gás",
                      callBack: (String imgPath) {
                        this._fotoSeloGas = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            _store.solicitarSubstituicaoVeiculoTaxi(
                                veiculoId: this.veiculoId.toString(),
                                fotoCRLV: this._fotoCRLV,
                                fotoComprovanteRetiradaTaximetroAfericao:
                                    this._fotoComprovanteTaximetroTacografo,
                                fotoSeloGas: this._fotoSeloGas,
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
