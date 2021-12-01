import 'package:sa_transportes_mobile/screen/loading_screen.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/permissionario_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/solicitacao_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


void main() async {
  await DotEnv().load('.env');

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(

      /// Providers are above [MyApp] instead of inside it, so that tests
      /// can use [MyApp] while mocking the providers
      MultiProvider(
        providers: [
          Provider<MainStore>(create: (_) => MainStore()),
          Provider<CondutorStore>(create: (_) => CondutorStore()),
          Provider<MonitorStore>(create: (_) => MonitorStore()),
          Provider<VeiculoStore>(create: (_) => VeiculoStore()),
          Provider<SolicitacaoStore>(create: (_) => SolicitacaoStore()),
          Provider<PermissionarioStore>(create: (_) => PermissionarioStore()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SA TRANSPORTES',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Util.hexToColor("#2d9cdb"),
        accentColor: Util.hexToColor("#2d9cdb"),
        buttonColor: Util.hexToColor("#444444"),
        //,
        errorColor: Colors.red,
        //
        appBarTheme: AppBarTheme(
            color: Util.hexToColor("#2d9cdb"), //,
            textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
            )),

        // Define the default font family.
        //fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Util.hexToColor("#797979")),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: LoadingStartScreen(),
      home: LoadingStartScreen(),
    );
  }
}
