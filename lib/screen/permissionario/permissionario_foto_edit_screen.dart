
import 'package:cityconnect/stores/permissionario/permissionario_store.dart';
import 'package:cityconnect/tiles/photo_person_tile.dart';
import 'package:cityconnect/widgets/custom_alert_message.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PermissionarioFotoScreen extends StatefulWidget {
  @override
  _PermissionarioFotoScreenState createState() => _PermissionarioFotoScreenState();
}

class _PermissionarioFotoScreenState extends State<PermissionarioFotoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _image = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PermissionarioStore permissionarioStore = Provider.of<PermissionarioStore>(context);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            "Foto do Permissionário",
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          if (permissionarioStore.loading)
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
                permissionarioStore.solicitacaoExistente
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
                    permissionarioStore.saveFoto(context: context, scaffoldKey: _scaffoldKey, foto: _image);
                  },
                )
              ],
            ),
          );
        }));
  }
}
