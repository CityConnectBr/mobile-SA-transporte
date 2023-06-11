import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satrans_new_app/providers/search_plate_provider.dart';
import 'package:satrans_new_app/utils/custom_theme.dart';
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
                  const SizedBox(
                    height: 40.0,
                  ),
                  InputButtonSearch(
                    hintText: 'Pesquisar por placa, ex: ABC-1234',
                    onPressed:
                        Provider.of<SearchPlateProvider>(context, listen: false)
                            .searchPlaca,
                    controller: Provider.of<SearchPlateProvider>(context,
                            listen: false)
                        .placaController,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Consumer<SearchPlateProvider>(
                    builder: (context, provider, child) {
                      if (provider.placaValida!=null){
                        return Container(
                          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: provider.placaValida!
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(
                                  provider.placaValida!
                                      ? Icons.thumb_up
                                      : Icons.thumb_down,
                                  color: CustomTheme.primaryColor,
                                  size: 35.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Text(
                                  provider.placaValida!
                                      ? 'Placa ${provider.placaController.text.toUpperCase()} está autorizada a operar!'
                                      : 'Placa ${provider.placaController.text.toUpperCase()} não está autorizada. Para mais informações, ligue 4433-7533',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }        

                      return Container();                
                    },
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
