import 'package:carousel_slider/carousel_slider.dart';
import 'package:sa_transportes_mobile/screen/login_screen.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:sa_transportes_mobile/widgets/custom_raisedbutton.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen>
    with SingleTickerProviderStateMixin {
  int _current = 0;

  @override
  void initState() {
    super.initState();

    //--------------------- LOADS -----------------

    //para testes
    //zerando
    //UserController.of(context).cleanPrefs();

    /*UserController.of(context).loadOffline().then((r){
      if(r){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CardScreen())
        );
      }
    });*/

//      _animationController.addStatusListener((status) async{
//      Navigator.of(context).pushReplacement(
//          MaterialPageRoute(builder: (context) => LoginScreen())
//      );
//    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: 10.0, left: 10.0, bottom: 20.0, top: 20.0),
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Column(children: [
                    CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          height: 480.0,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Theme.of(context).primaryColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
                Expanded(child: Container()),
                CustomRaisedButtonWhite(
                  label: "Começar",
                  func: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'images/slide_01.png',
  'images/slide_02.png',
  'images/slide_03.png',
  'images/slide_04.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();
