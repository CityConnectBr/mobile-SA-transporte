import 'package:get_it/get_it.dart';
import 'package:sa_transportes_mobile/screen/splash_screen.dart';
import 'package:sa_transportes_mobile/stores/fiscal/emissao_multa_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/permissionario_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/solicitacao_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/stores/splash_store.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await DotEnv().load('.env.prod');
  } else {
    await DotEnv().load('.env');
  }

  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AppState>(AppState());

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
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
          Provider<SplashStore>(create: (_) => SplashStore()),
          Provider<EmissaoMultaStore>(create: (_) => EmissaoMultaStore()),
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
        primaryColor: Util.hexToColor("#12407c"), //2d9cdb
        accentColor: Util.hexToColor("#2d9cdb"),
        buttonColor: Util.hexToColor("#444444"),
        //,
        errorColor: Colors.red,
        //
        appBarTheme: AppBarTheme(
          color: Util.hexToColor("#12407c"), //,
          textTheme: const TextTheme(
            headline6: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
