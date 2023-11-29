import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sa_transportes_mobile/models/alvara_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/pagamento_alvara_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';

class PagamentoAlvaraScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Alvara alvara;

  PagamentoAlvaraScreen(this.alvara);

  @override
  Widget build(BuildContext context) {
    ParamengoAlvaraStore store = Provider.of<ParamengoAlvaraStore>(context);

    final pixcode = store.gerarPIX(alvara);

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
                                            alvara.valor ?? ""),
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
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: QrImageView(
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
                            child: ElevatedButton(
                                child: const Icon(
                                  Icons.content_copy,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  store.copyToClipboard(
                                      pixcode, context, _scaffoldKey);
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomRaisedButtonBlue(
                        label: "Informar Pagamento",
                        func: () {
                          store.informarPagamento(
                              alvara: alvara,
                              context: context,
                              scaffoldKey: _scaffoldKey);
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
