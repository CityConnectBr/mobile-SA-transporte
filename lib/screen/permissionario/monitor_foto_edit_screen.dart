import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/tiles/photo_person_tile.dart';
import 'package:sa_transportes_mobile/widgets/custom_alert_message.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MonitorFotoScreen extends StatefulWidget {
  @override
  _MonitorFotoScreenState createState() => _MonitorFotoScreenState();
}

class _MonitorFotoScreenState extends State<MonitorFotoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _image = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MonitorStore monitorStore = Provider.of<MonitorStore>(context);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            "Foto do Condutor",
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          if (monitorStore.loading)
            return Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          return Container(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                monitorStore.solicitacaoExistente
                    ? CustomAlertMessage(
                        type: CustomAlertMessage.WANNING,
                        message: "Já existe uma solicitação em andanmento! Uma nova alteração irá cancelar a solicitação anterior.",
                      )
                    : Container(),
                PhotoPersonTile(
                  callBack: (image) {
                    this._image = image;
                  },
                  imagePath: _image,
                  size: 220.0,
                  typeButton: PhotoPersonTile.CAM_INSIDE_PHOTO,
                ),
                CustomRaisedButtonWhite(
                  label: "Salvar",
                  func: () {
                    monitorStore.saveFotoMonitor(context: context, scaffoldKey: _scaffoldKey, foto: _image);
                  },
                )
              ],
            ),
          );
        }));
  }
}
