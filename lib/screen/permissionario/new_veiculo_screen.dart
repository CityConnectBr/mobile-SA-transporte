import 'package:cityconnect/stores/permissionario/veiculo_store.dart';
import 'package:cityconnect/widgets/custom_autocomplete.dart';
import 'package:cityconnect/widgets/custom_dropdown.dart';
import 'package:cityconnect/widgets/custom_image_picker_field.dart';
import 'package:cityconnect/widgets/custom_input_field.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class NewVeiculoScreen extends StatefulWidget {
  @override
  _NewVeiculoScreenState createState() => _NewVeiculoScreenState();
}

class _NewVeiculoScreenState extends State<NewVeiculoScreen> with SingleTickerProviderStateMixin {
  final _placaController = TextEditingController();
  final _renavanController = TextEditingController();
  final _chassiController = TextEditingController();
  final _anoDeFabricacaoController = TextEditingController();
  final _anoDoModeloController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _tipoVeiculoController = TextEditingController();
  final _observacaoDaCapacidadeController = TextEditingController();
  final _anosDeVidaUtilDoVeiculoController = TextEditingController();
  final _marcaModeloVeiculoController = TextEditingController();
  final _tipoCombustivelController = TextEditingController();
  final _corController = TextEditingController();

  String idMarcaModeloSelectd;
  String idTipoCombustivelSelectd;
  String idCorSelectd;
  String idTipoSelectd;

  String _tipoDaCapacidade;
  String _image;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _placaController.dispose();
    _renavanController.dispose();
    _chassiController.dispose();
    _anoDeFabricacaoController.dispose();
    _anoDoModeloController.dispose();
    _capacidadeController.dispose();
    _tipoVeiculoController.dispose();
    _observacaoDaCapacidadeController.dispose();
    _anosDeVidaUtilDoVeiculoController.dispose();
    _marcaModeloVeiculoController.dispose();
    _tipoCombustivelController.dispose();
    _corController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VeiculoStore _veiculoStore = Provider.of<VeiculoStore>(context);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Veículo',
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
                    CustomInputFieldGrey(
                      controller: _placaController,
                      label: "PLACA",
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputAutocomplete(
                        controller: _marcaModeloVeiculoController,
                        label: "MARCA/MODELO",
                        searchCallback: _veiculoStore.searchMarcaModelo,
                        setSelected: (s) => idMarcaModeloSelectd = s.id),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _renavanController,
                      label: "RENAVAN",
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _chassiController,
                      label: "CHASSI",
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputAutocomplete(
                        controller: _tipoCombustivelController,
                        label: "TIPO DE COMBUSTIVEL",
                        searchCallback: _veiculoStore.searchTipoCombustivel,
                        setSelected: (s) => idMarcaModeloSelectd = s.id),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _anoDeFabricacaoController,
                      label: "ANO DE FABRICACAO",
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _anoDoModeloController,
                      label: "ANO DO MODELO",
                      obscure: false,
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputAutocomplete(
                        controller: _corController, label: "COR", searchCallback: _veiculoStore.searchCorVeiculo, setSelected: (s) => idCorSelectd = s.id),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputAutocomplete(
                        controller: _tipoVeiculoController,
                        label: "TIPO DE VEICULO",
                        searchCallback: _veiculoStore.searchTipoVeiculo,
                        setSelected: (s) => print(s.id)),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _capacidadeController,
                      label: "CAPACIDADE",
                      obscure: false,
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomDropdown(
                      dropdownValues: const <String>['A', 'AB', 'AC', 'AD', 'AE', 'B', 'C', 'D', 'E'],
                      hint: Text("TIPO DA CAPACIDADE:"),
                      value: this._tipoDaCapacidade,
                      onChanged: (newValue) {
                        setState(() {
                          this._tipoDaCapacidade = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _observacaoDaCapacidadeController,
                      label: "OBSERVAÇÃO DA CAPACIDADE",
                      obscure: false,
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _anosDeVidaUtilDoVeiculoController,
                      label: "ANOS DE VIDA",
                      obscure: false,
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: this._image,
                      text: "Documento do Veículo",
                      callBack: (String imgPath) {
                        this._image = imgPath;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState.validate()) {
                            // condutorStore.saveAbaDadosNewCondutor(
                            //     nome: this._nomeController.text,
                            //     email: this._emailController.text,
                            //     cpf: Util.clearString(this._cpfController.text),
                            //     ddd: this._dddController.text,
                            //     celular:
                            //     Util.clearString(this._celController.text),
                            //     rg: this._rgController.text,
                            //     telefone: Util.clearString(
                            //         this._phoneController.text),
                            //     vencimentoCNH: Util.dateFormatddMMyyyy
                            //         .parse(this._vencimentoCNHController.text),
                            //     cnh: this._cnhController.text,
                            //     categoriaCNH: this._categoriaCNH,
                            //     imgComprovanteCNH: this._imageCNH,
                            //     context: context,
                            //     scaffoldKey: _scaffoldKey);
                          }
                        }),
                  ],
                )),
          ),
        ));
  }
}
