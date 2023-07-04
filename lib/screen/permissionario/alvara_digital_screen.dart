import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_transportes_mobile/models/permissionario_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/permissionario_store.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';

class AlvaraDigitalPermissionarioScreen extends StatefulWidget {
  const AlvaraDigitalPermissionarioScreen();

  @override
  State<AlvaraDigitalPermissionarioScreen> createState() =>
      _AlvaraDigitalPermissionarioScreenState();
}

class _AlvaraDigitalPermissionarioScreenState
    extends State<AlvaraDigitalPermissionarioScreen> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cnhController = TextEditingController();
  final _veiculoController = TextEditingController();
  final _placaController = TextEditingController();
  final _prefixoController = TextEditingController();
  final _localController = TextEditingController();
  // Str _fotoUrl;

  String _image = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {   
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
    PermissionarioStore store = Provider.of<PermissionarioStore>(context);

    Permissionario? perm = store.usuario?.permissionario;
    if (perm != null) {
      _nomeController.text = perm.nome??'';
      _cpfController.text = perm.cpfCnpj??'';
      _cnhController.text = perm.cnh??'';
      //TODO
      //_veiculoController.text = perm.veiculo!.modelo!;
      ///_placaController.text = perm.veiculo!.placa!;
      ///_prefixoController.text = perm.prefixo!;
      //_localController.text = perm.veiculo!.local!;
      _image = perm.fotoUrl??'';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alvará Digital',
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputFieldGrey(
                        controller: _nomeController,
                        label: "Permissionário",
                        enabled: false,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CustomInputFieldGrey(
                              controller: _cpfController,
                              label: "CPF",
                              hint: "CPF",
                              enabled: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomInputFieldGrey(
                              controller: _cnhController,
                              label: "CNH",
                              hint: "CNH",
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomInputFieldGrey(
                        controller: _veiculoController,
                        label: "Veículo",
                        hint: "Veículo",
                        enabled: false,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CustomInputFieldGrey(
                              controller: _placaController,
                              label: "Placa",
                              hint: "Placa",
                              enabled: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomInputFieldGrey(
                              controller: _prefixoController,
                              label: "Prefixo",
                              hint: "Prefixo",
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomInputFieldGrey(
                        controller: _localController,
                        label: "Local",
                        hint: "Local",
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
              //foto do permissionário
              Expanded(
                flex: 1,
                child: Image.asset('images/photo-user.jpeg', fit: BoxFit.fill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
