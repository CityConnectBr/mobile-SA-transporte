import 'package:sa_transportes_mobile/models/permissionario_model.dart';
import 'package:sa_transportes_mobile/tiles/identity_tile.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';

class CardPermissionarioTile extends StatelessWidget {
  final Permissionario _permissionario;

  CardPermissionarioTile(this._permissionario);

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
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: //_fotoStr != null
                        // ? FileImage(File(_fotoStr))
                        // :
                        AssetImage("images/foto_motorista.png"))),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextSearchResult(
                  customText: this._permissionario.nome,
                  color: StyleUtil.colorGrey,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextSearchResult(
                  customText: "CPF/CNPJ: ",
                  item: this._permissionario.cpfCnpj,
                  color: StyleUtil.colorGrey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardPermissionarioSimplesTile extends StatelessWidget {
  final Permissionario _permissionario;

  CardPermissionarioSimplesTile(this._permissionario);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IdentityTile(
            customImage: "images/foto_motorista.png",
            ocupation: "Permissionário",
            name: this._permissionario.nome,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${(this._permissionario.cpfCnpj?.length ?? 0) > 11 ? "CNPJ" : "CPF"}: ${this._permissionario.cpfCnpj}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                ),
                Text(
                  "RG: ${this._permissionario.rg}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                ),
                Text(
                  "Prefixo: ${this._permissionario.prefixo}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                ),
                Text(
                  "Ativo: ${this._permissionario.ativo == '1' ? "Sim" : "Não"}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                ),
                Text(
                  "Data Vencimento: ${this._permissionario.alvara?.dataVencimento != null ? Util.dateFormatddMMyyyy.format(this._permissionario.alvara!.dataVencimento!) : ""}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                ),
                Text(
                  "Alvará Vencido: ${this._permissionario.alvara?.isExpired() ?? false ? "Sim" : "Não"}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
