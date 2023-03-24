import 'package:flutter/material.dart';
import 'package:satrans_new_app/utils/customTheme.dart';
import 'package:satrans_new_app/widgets/footer.dart';
import 'package:satrans_new_app/widgets/input_button_search.dart';

class SearchPlateScreen extends StatefulWidget {
  const SearchPlateScreen({super.key});

  @override
  State<SearchPlateScreen> createState() => _SearchPlateScreenState();
}

class _SearchPlateScreenState extends State<SearchPlateScreen> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          bottomNavigationBar: orientation == Orientation.portrait
              ? Stack(
                  children: [
                    Container(
                      height: 200.0,
                      color: CustomTheme.primaryColor,
                    ),
                    const Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: 0.0,
                        bottom: 0.0,
                        child: Footer()),
                  ],
                )
              : null,
          backgroundColor: const Color(0xFF12407c),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo_borda.png',
                        fit: BoxFit.contain,
                        width: 180,
                        height: 180,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InputButtonSearch(),
                  SizedBox(
                    height: 40.0,
                  ),
                  //joinha verde com texto tudo certo
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: const Icon(
                            Icons.thumb_up,
                            color: CustomTheme.primaryColor,
                            size: 35.0,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Tudo certo com a placa pesquisada!',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  orientation == Orientation.landscape
                      ? Container(
                          height: 200.0,
                          color: CustomTheme.primaryColor,
                          child: const Footer(),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
