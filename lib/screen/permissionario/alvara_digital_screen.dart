import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      _nomeController.text = perm.nome ?? '';
      _cpfController.text = perm.cpfCnpj ?? '';
      _cnhController.text = perm.cnh ?? '';
    }

    store.loadPhotoUser();

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
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
                        ],
                      ),
                    ),
                  ),
                  //foto do permissionário
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (_) {
                        return store.photoUser == null
                            ? Image.asset(
                                "images/photo-user.jpeg",
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                store.photoUser!,
                                fit: BoxFit.cover,
                              );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              StatusAltevaTile(permissionario: perm),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusAltevaTile extends StatelessWidget {
  final Permissionario? permissionario;

  const StatusAltevaTile({super.key, this.permissionario});

  @override
  Widget build(BuildContext context) {
    if (permissionario?.alvara?.isExpired() ?? false) {
      return Column(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 100.0,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              "Alvará Vencido",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      );
    } else if (permissionario?.alvara?.dataVencimento != null) {
      return Column(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 100.0,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              "Vencimento: ${permissionario?.alvara?.dataVencimento?.day}/${permissionario?.alvara?.dataVencimento?.month}/${permissionario?.alvara?.dataVencimento?.year}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      );
    }

    return Container();
  }
}
