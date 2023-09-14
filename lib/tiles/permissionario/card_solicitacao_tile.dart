import 'package:sa_transportes_mobile/models/solicitacao_alteracao_model.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';

class CardSolicitacaoTile extends StatelessWidget {
  final SolicitacaoDeAlteracao _solicitacao;

  CardSolicitacaoTile(this._solicitacao);

  final nameItem = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Util.hexToColor("#D5DDE0")),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Util.hexToColor("#f5f5f5"),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  _solicitacao.tipoSolicitacao?.nomeToShow ?? '',
                  style: nameItem,
                  softWrap: true,
                ),
              ),
            ],
          )),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _solicitacao.createdAt != null
                    ? Util.dateFormatddMMyyyyHHmm
                        .format(_solicitacao.createdAt!)
                    : '',
                style: nameItem,
              ),
              Row(
                children: [
                  Text(
                    _solicitacao.statusToShow,
                    style: nameItem,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  getStatusIcon(_solicitacao.status ?? '') ?? Container(),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Icon? getStatusIcon(String status) {
    if (_solicitacao.status == null) {
      return Icon(Icons.lock_clock);
    } else if (status.contains("A")) {
      return Icon(Icons.check);
    } else if (status.contains("R")) {
      return Icon(Icons.close);
    } else if (status.contains("C")) {
      return Icon(Icons.cancel);
    }
  }
}
