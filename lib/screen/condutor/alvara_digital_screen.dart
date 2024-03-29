import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as dev;

import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';

class AlvaraDigitalScreen extends StatefulWidget {
  // AlvaraDigitalScreen();

  @override
  _AlvaraDigitalScreenState createState() => _AlvaraDigitalScreenState();
}

class _AlvaraDigitalScreenState extends State<AlvaraDigitalScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cnhController = TextEditingController();
  final _veiculoController = TextEditingController();
  final _placaController = TextEditingController();
  final _prefixoController = TextEditingController();
  final _localController = TextEditingController();
  // Str _fotoUrl;

  String _image = "";

  bool _flagIsLoad = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _nomeController.dispose();
    _cpfController.dispose();
    _cnhController.dispose();
    _veiculoController.dispose();
    _placaController.dispose();
    _prefixoController.dispose();
    _localController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore _condutorStore = Provider.of<CondutorStore>(context);

    _condutorStore.showAlvara(context: context, scaffoldKey: _scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Util.hexToColor("#EEEEEE"),
      appBar: AppBar(
        title: const Text(
          'Alvará Digital',
        ),
        toolbarHeight: 30,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: 10.0),
        child: BoxStackRounded(
          child: ListView(
            children: <Widget>[
              Observer(builder: (_) {
                if (_condutorStore.loading)
                  return Container(
                    margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                if (!this._flagIsLoad) {
                  this._flagIsLoad = true;
                  if (_condutorStore.condutores != null &&
                      _condutorStore.condutores!.isNotEmpty) {
                    final perm = _condutorStore.condutores!.first;
                    _nomeController.text = perm.nome ?? '';
                    _cpfController.text = perm.cpf ?? '';
                    _cnhController.text = perm.cnh ?? '';
                    _veiculoController.text =
                        ''; //perm?.veiculo?.marcaModeloVeiculo?.descricao;
                    _placaController.text = ''; //perm?.veiculo?.placa;
                    _prefixoController.text = ''; // perm?.prefixo;
                    _localController.text = perm.endereco?.endereco ?? '';
                    _image = perm.fotoUrl ?? '';
                    // this._flagIsLoad = false;
                  }
                  // _nomeController.text = _permissionarioStore.permissionario.nome;
                }
                return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: (_condutorStore.condutores != null &&
                            _condutorStore.condutores!.isNotEmpty)
                        ? Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  children: [
                                    CustomInputFieldGrey(
                                      controller: _nomeController,
                                      label: "Permissionário",
                                      enabled: false,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: CustomInputFieldGrey(
                                            controller: _cpfController,
                                            label: "CPF",
                                            hint: "CPF",
                                            enabled: false,
                                          ),
                                        ),
                                        // Spacer(flex: 1),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: CustomInputFieldGrey(
                                            controller: _cnhController,
                                            label: "CNH",
                                            hint: "CNH",
                                            enabled: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    CustomInputFieldGrey(
                                      controller: _veiculoController,
                                      label: "Veículo",
                                      hint: "Veículo",
                                      enabled: false,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: CustomInputFieldGrey(
                                            controller: _placaController,
                                            label: "Placa",
                                            hint: "placa",
                                            enabled: false,
                                          ),
                                        ),
                                        // Spacer(flex: 1),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: CustomInputFieldGrey(
                                            controller: _prefixoController,
                                            label: "Prefixo",
                                            hint: "prefixo",
                                            enabled: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    CustomInputFieldGrey(
                                      controller: _localController,
                                      label: "Local",
                                      hint: "local",
                                      enabled: false,
                                    ),
                                  ],
                                ),
                              ),
                              _image != null
                                  ? Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                      margin: EdgeInsets.fromLTRB(
                                          20.0, 0.0, 0.0, 0.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Util.hexToColor("#c3c3c3"),
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(_image))),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                      margin: EdgeInsets.fromLTRB(
                                          20.0, 0.0, 0.0, 0.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Util.hexToColor("#c3c3c3"),
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: const Center(
                                        child: Text('Foto'),
                                      ),
                                    ),
                            ],
                          )
                        : Center(
                            child: Text(
                              "Nenhum condutor encontrado!",
                              style: StyleUtil.textBlueBoldSize20,
                            ),
                          ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
