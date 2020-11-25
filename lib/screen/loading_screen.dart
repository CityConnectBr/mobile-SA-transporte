import 'package:cityconnect/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingStartScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingStartScreen>
    with SingleTickerProviderStateMixin {
  bool _flagOneBuild = false;

  static bool _hasLoaded = false;

  MainStore _mainStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loading() async {
    if (!_flagOneBuild) {
      _flagOneBuild = true;

      if (!_hasLoaded) {
        _hasLoaded = true;
        await Future.delayed(Duration(seconds: 3));
      }

      try {
        _mainStore.isLoggedInWithRedirect(context: context);
      }catch(e){

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _mainStore = Provider.of<MainStore>(context);
    Future.delayed(Duration.zero, () => _loading());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Theme.of(context).primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: height * 0.30, bottom: 10),
                  child: Container(
                    width: 220,
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                  ),
                ),
                Expanded(child: Container()),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "images/bottom_white.png",
                      fit: BoxFit.contain,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 140.0),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "images/logo_santo_andre.png",
                        fit: BoxFit.contain,
                        width: 200,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
