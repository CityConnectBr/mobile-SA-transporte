
import 'package:cityconnect/stores/permissionario/condutor_store.dart';
import 'package:cityconnect/tiles/photo_person_tile.dart';
import 'package:cityconnect/widgets/custom_alert_message.dart';
import 'package:cityconnect/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CondutorFotoScreen extends StatefulWidget {
  @override
  _CondutorFotoScreenState createState() => _CondutorFotoScreenState();
}

class _CondutorFotoScreenState extends State<CondutorFotoScreen> {
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
    CondutorStore condutorStore = Provider.of<CondutorStore>(context);

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
          if (condutorStore.loading)
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
                condutorStore.solicitacaoExistente
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
                    condutorStore.saveFotoCondutor(context: context, scaffoldKey: _scaffoldKey, foto: _image);
                  },
                )
              ],
            ),
          );
        }));
  }
}
