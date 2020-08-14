import 'package:cityconnect/screen/fiscal/search_condutor_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_condutor_screen.dart';
import 'package:cityconnect/screen/permissionario/cadastro_veiculo_screen.dart';
import 'package:cityconnect/widgets/custom_box_home.dart';
import 'package:flutter/material.dart';

class HomeFiscalTile extends StatefulWidget {
  @override
  _HomeFiscalTileState createState() => _HomeFiscalTileState();
}

class _HomeFiscalTileState extends State<HomeFiscalTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchCondutorScreen()));
            },
            child: CustomBoxHome(
              icon: "images/icon-eye.png",
              description: "Visualizar Condutores",
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadastroCondutorScreen()));
            },
            child: CustomBoxHome(
              icon: "images/icon-face.png",
              description: "Novo Permissionário",
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CadastroVeiculoScreen()));
            },
            child: CustomBoxHome(
              icon: "images/icon-car.png",
              description: "Novo Veículo",
            ),
          ),
        ],
      ),
    );
  }
}
