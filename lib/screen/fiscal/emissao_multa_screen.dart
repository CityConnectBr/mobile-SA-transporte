import 'package:sa_transportes_mobile/util/style_util.dart';
import 'package:sa_transportes_mobile/widgets/box_rounded.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EmissaoDeMultaScreen extends StatefulWidget {
  @override
  _EmissaoDeMultaScreenState createState() => _EmissaoDeMultaScreenState();
}

class _EmissaoDeMultaScreenState extends State<EmissaoDeMultaScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Util.hexToColor("#EEEEEE"),
        appBar: AppBar(
          title: const Text(
            'Multas',
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.add),
              ),
              onTap: () {},
            )
          ],
          elevation: 0.0,
        ),
        body:

            Center(
            child: Text(
          "Nenhuma multa encontrada!",
          style: StyleUtil.textBlueBoldSize20,
        )));
  }
}
