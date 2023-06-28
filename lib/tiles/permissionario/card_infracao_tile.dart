import 'package:sa_transportes_mobile/models/infracao_model.dart';
import 'package:sa_transportes_mobile/screen/permissionario/infracao_screen.dart';
import 'package:sa_transportes_mobile/stores/permissionario/infracao_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardInfracaoTile extends StatefulWidget {
  final Infracao _infracao;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CardInfracaoTile(this._infracao, this.scaffoldKey);

  @override
  _CardInfracaoTileState createState() =>
      _CardInfracaoTileState(_infracao, scaffoldKey);
}

class _CardInfracaoTileState extends State<CardInfracaoTile> {
  final Infracao _infracao;
  final GlobalKey<ScaffoldState> scaffoldKey;
  _CardInfracaoTileState(this._infracao, this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    InfracaoStore infracaoStore = Provider.of<InfracaoStore>(context);

    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Util.hexToColor("#D5DDE0")),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
          color: Util.hexToColor("#f5f5f5"),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
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
                            text: Util.formatStringToMoney(_infracao.valor),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      text: _infracao.codigoInfracao,
                    ),
                    CustomText(
                      text: DateUtil.formatddMMyyyy(_infracao.dataInfracao),
                    ),
                  ],
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
                    text: _infracao.descricaoInfracao,
                    style: TextStyle(color: Theme.of(context).primaryColor)),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_infracao.status == "pendente" ||
                    _infracao.status == "confirmacao_rejeitada")
                  RaisedButton(
                      child: const Text("Informar Pagamento"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        infracaoStore.pagar(
                            context: context,
                            scaffoldKey: scaffoldKey,
                            infracao: _infracao);
                      }),
                if (_infracao.status != "pendente" &&
                    _infracao.status != "confirmacao_rejeitada")
                  IconButton(
                    icon: Icon(Icons.qr_code_scanner),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => InfracaoDetailScreen(
                            _infracao,
                          ),
                        ),
                      );
                    },
                  ),
                StatusInfracao(_infracao.status),
              ],
            ),
          ],
        ));
  }
}

class StatusInfracao extends StatelessWidget {
  final String status;

  const StatusInfracao(this.status);

  @override
  Widget build(BuildContext context) {
    //pendente, pago, confirmacao_pendente, confirmacao_rejeitada
    if (status == "pendente") {
      return Text(
        "Pendente",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      );
    } else if (status == "pago") {
      return Text(
        "Pago",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      );
    } else if (status == "confirmacao_pendente") {
      return Text(
        "Confirmação Pendente",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      );
    } else if (status == "confirmacao_rejeitada") {
      return Text(
        "Confirmação Rejeitada",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      );
    } else {
      return Container();
    }
  }
}
