import 'dart:io';

import 'package:sa_transportes_mobile/models/monitor_model.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_text_search_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardMonitorTile extends StatefulWidget {
  final Monitor _monitor;

  CardMonitorTile(this._monitor);

  @override
  _CardMonitorTileState createState() => _CardMonitorTileState(this._monitor);
}

class _CardMonitorTileState extends State<CardMonitorTile> {
  final Monitor _monitor;

  File foto;

  _CardMonitorTileState(this._monitor);

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    if(foto==null) {
      monitorStore.loadPhotoFromMonitor(_monitor).then((value) =>
      {
        print(value != null),
        if(value!=null){
          setState(() {
            foto = value;
          })
        }
      });
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Util.hexToColor("#D5DDE0")),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
        color: Util.hexToColor("#f5f5f5"),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: BoxFit.cover, image: foto != null ? FileImage(foto) : AssetImage("images/photo-user.jpeg"))),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextSearchResult(
                  customText: this._monitor.nome,
                  color: StyleUtil.colorGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
