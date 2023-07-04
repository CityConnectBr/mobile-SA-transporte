import 'package:brasil_fields/brasil_fields.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewMonitorTile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  NewMonitorTile(this._globalKey);

  @override
  _NewMonitorTileState createState() => _NewMonitorTileState(_globalKey);
}

class _NewMonitorTileState extends State<NewMonitorTile> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dataNascController = TextEditingController();
  String? _image;

  bool _flagIsLoad = false;
  bool _flagCelular = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  _NewMonitorTileState(this._scaffoldKey);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dataNascController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    if (!_flagIsLoad) {
      _flagIsLoad = true;
      _nomeController.text = monitorStore.solicitacaoDeAlteracao?.campo10 ?? '';
      _cpfController.text =
          Util.clearString(monitorStore.solicitacaoDeAlteracao?.campo11 ?? '');
      _rgController.text = monitorStore.solicitacaoDeAlteracao?.campo12 ?? '';
      _phoneController.text = monitorStore.solicitacaoDeAlteracao?.campo2 ?? '';
      _emailController.text = monitorStore.solicitacaoDeAlteracao?.campo1 ?? '';
      _dataNascController.text =
          monitorStore.solicitacaoDeAlteracao?.campo13 != null
              ? Util.convertyyyyMMddToddMMyyyy(
                  monitorStore.solicitacaoDeAlteracao!.campo13!)
              : '';
      _image = monitorStore.solicitacaoDeAlteracao?.arquivo1;
    }

    return Container(
      child: Observer(builder: (_) {
        if (monitorStore.loading)
          return Container(
            margin: const EdgeInsets.only(top: 100.0, bottom: 100.0),
            child: const Center(
              child: const CircularProgressIndicator(),
            ),
          );

        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Text(
                          "Dados de Identidade",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _nomeController,
                      label: "NOME",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateIsEmpty,
                      hint: "NOME",
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _cpfController,
                            label: "CPF",
                            type: TextInputType.text,
                            validator: ValidatorsUtil.validateCPF,
                            hint: "CPF",
                            inputFormatters: [CpfInputFormatter()],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: CustomInputFieldGrey(
                            controller: _rgController,
                            label: "RG",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateIsEmpty,
                            hint: "RG",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _dataNascController,
                      label: "DATA NASC.",
                      type: TextInputType.number,
                      hint: "DATA NASCIMENTO",
                      validator: ValidatorsUtil.validateDate,
                      inputFormatters: [DataInputFormatter()],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'Dados de Contato',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _emailController,
                      label: "E-MAIL",
                      type: TextInputType.text,
                      validator: ValidatorsUtil.validateEmail,
                      hint: "E-MAIL",
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomInputFieldGrey(
                      controller: _phoneController,
                      label: "TELEFONE",
                      type: TextInputType.number,
                      hint: "TELEFONE",
                      inputFormatters: [TelefoneInputFormatter()],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    CustomImagePickerField(
                      imagePath: _image,
                      text: "Comprovante de Identidade",
                      callBack: (String imgPath) {
                        _image = imgPath;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Salvar",
                        func: () {
                          if (_formKey.currentState!.validate()) {
                            monitorStore.saveAbaDadosNewMonitor(
                                nome: _nomeController.text,
                                email: _emailController.text,
                                cpf: Util.clearString(_cpfController.text),
                                rg: _rgController.text,
                                telefone: Util.clearString(
                                    _phoneController.text),
                                dataNasc: Util.dateFormatddMMyyyy
                                    .parse(_dataNascController.text),
                                imgComprovante: _image ?? '',
                                context: context,
                                scaffoldKey: _scaffoldKey);
                          }
                        }),
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
