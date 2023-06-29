import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/util/mask_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/util/validators.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_dialog.dart';
import 'package:sa_transportes_mobile/widgets/custom_dropdown.dart';
import 'package:sa_transportes_mobile/widgets/custom_image_picker_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_input_field.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CondutorDadosCnhScreen extends StatefulWidget {
  @override
  _CondutorDadosCnhScreenState createState() => _CondutorDadosCnhScreenState();
}

class _CondutorDadosCnhScreenState extends State<CondutorDadosCnhScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _image;
  final picker = ImagePicker();

  final _cnhController = TextEditingController();
  final _vencimentoCNHController = MaskedTextController(mask: MaskUtil.dateMask);
  String _categoriaCNH;
  String _selectedCategory;
  final _dateFormat = Util.dateFormatddMMyyyy;

  bool _flagIsLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _cnhController.dispose();
    _vencimentoCNHController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

    if (!this._flagIsLoad) {
      this._flagIsLoad = true;
      if (condutorStore.solicitacaoExistente) {
        _cnhController.text = condutorStore.solicitacaoDeAlteracao.campo1;
        _categoriaCNH = condutorStore.solicitacaoDeAlteracao.campo2;
        _vencimentoCNHController.text =
            condutorStore.solicitacaoDeAlteracao.campo3 != null ? Util.convertyyyyMMddToddMMyyyy(condutorStore.solicitacaoDeAlteracao.campo3) : "";
      } else {
        _cnhController.text = condutorStore.condutor.cnh;
        _categoriaCNH = condutorStore.condutor.categoriaCNH;
        _vencimentoCNHController.text =
            condutorStore.condutor.vencimentoCNH != null ? Util.dateFormatddMMyyyy.format(condutorStore.condutor.vencimentoCNH) : "";
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Dados CNH",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
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
                    condutorStore.solicitacaoExistente
                        ? CustomAlertMessage(
                      type: CustomAlertMessage.WANNING,
                      message: "Já existe uma solicitação em andanmento! Uma nova alteração irá cancelar a solicitação anterior.",
                    )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Dados de CNH",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          CustomInputFieldGrey(
                            controller: _cnhController,
                            label: "CNH",
                            type: TextInputType.number,
                            validator: ValidatorsUtil.validateNumberAndNotIsEmpty,
                            hint: "CNH",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomDropdown(
                                  dropdownValues:  <String>['A', 'AB', 'AC', 'AD', 'AE', 'B', 'C', 'D', 'E'],
                                  hint: Text("CATEGORIA"),
                                  value: this._categoriaCNH,//this._categoriaCNH ?? "A", //!= null ? this._categoriaCNH : "",
                                  onChanged: (newValue) {
                                    setState(() {
                                      print(newValue);
                                      this._categoriaCNH = newValue;
                                      //this._selectedCategory = newValue;
                                    });
                                  },
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: CustomInputFieldGrey(
                                  controller: _vencimentoCNHController,
                                  label: "VALIDADE",
                                  type: TextInputType.text,
                                  hint: "VALIDADE",
                                  validator: ValidatorsUtil.validateDate,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomImagePickerField(
                            imagePath: this._image,
                            text: "Foto CNH",
                            callBack: (String imgPath) {
                              this._image = imgPath;
                            },
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          CustomRaisedButtonBlue(
                              label: "Salvar",
                              func: () {
                                if (_formKey.currentState.validate()) {
                                  CustomDialog().showConfirmDialog(
                                      context: context,
                                      text: "Tem certeza que\ndeseja salvar?",
                                      voidCallbackSim: () {
                                        condutorStore.saveCNHCondutor(
                                            cnh: this._cnhController.text,
                                            categoria: this._categoriaCNH,
                                            validade: Util.dateFormatddMMyyyy.parse(this._vencimentoCNHController.text),
                                            imgComprovante: this._image,
                                            context: context,
                                            scaffoldKey: _scaffoldKey);
                                      },
                                      voidCallbackNao: () {});
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
