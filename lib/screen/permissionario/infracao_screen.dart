import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sa_transportes_mobile/models/infracao_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/infracao_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:sa_transportes_mobile/widgets/custom_text.dart';

class InfracaoDetailScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Infracao infracao;

  InfracaoDetailScreen(this.infracao);

  @override
  Widget build(BuildContext context) {
    InfracaoStore store = Provider.of<InfracaoStore>(context);

    final pixcode = store.gerarPIX(infracao);
    print(pixcode);
    final height = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Util.hexToColor("#EEEEEE"),
        appBar: AppBar(
          title: const Text(
            'Infração',
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 10.0),
            child: BoxStackRounded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 190.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: "Valor:",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ))
                                  ]),
                                ),
                                RichText(
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: Util.formatStringToMoney(
                                            infracao.valor),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0)),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          "Código: ${infracao.codigoInfracao}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          "Data: ${DateUtil.formatddMMyyyy(infracao.dataInfracao)}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: QrImage(
                            data: pixcode,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: RichText(
                            textAlign: TextAlign.left,
                            softWrap: true,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: pixcode,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Theme.of(context).primaryColor)),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                                child: Icon(
                                  Icons.content_copy,
                                  color: Colors.white,                                  
                                ),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                onPressed: () {
                                  store.copyToClipboard(pixcode, context, _scaffoldKey);
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      softWrap: true,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: infracao.descricaoInfracao,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor)),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
