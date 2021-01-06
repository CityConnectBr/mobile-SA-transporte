import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/solicitacao_alteracao_model.dart';
import 'package:cityconnect/util/style_util.dart';
import 'package:cityconnect/util/util.dart';
import 'package:cityconnect/widgets/custom_text_search_result.dart';
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
                Text(
                  this._solicitacao.tipoSolicitacao.nomeToShow.toUpperCase(),
                  style: nameItem,
                ),
              ],
            )
          ),
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Util.dateFormatddMMyyyyHHmm.format(this._solicitacao.createdAt),
                    style: nameItem,
                  ),
                  Row(
                    children: [
                      Text(
                        this._solicitacao.statusToShow,
                        style: nameItem,
                      ),
                      SizedBox(width: 20.0,),
                      getStatusIcon(this._solicitacao.status)
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

  Icon getStatusIcon(String status){
    if(this._solicitacao.status==null){
      return Icon(Icons.lock_clock);
    }else if(status.contains("A")){
      return Icon(Icons.check);
    }else if(status.contains("R")){
      return Icon(Icons.close);
    }else if(status.contains("C")){
      return Icon(Icons.cancel);
    }
  }

}