import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:sa_transportes_mobile/core/api/firebase_api.dart';
import 'package:sa_transportes_mobile/firebase_options.dart';
import 'package:sa_transportes_mobile/screen/splash_screen.dart';
import 'package:sa_transportes_mobile/stores/fiscal/emissao_multa_store.dart';
import 'package:sa_transportes_mobile/stores/mensagem_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/condutor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/infracao_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/monitor_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/permissionario_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/solicitacao_store.dart';
import 'package:sa_transportes_mobile/stores/permissionario/veiculo_store.dart';
import 'package:sa_transportes_mobile/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:sa_transportes_mobile/stores/splash_store.dart';
import 'package:sa_transportes_mobile/util/custom_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.prod");
  } else {
    await dotenv.load(fileName: ".env.develop");
  }

  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AppState>(AppState());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();

  runApp(
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
        Provider<InfracaoStore>(create: (_) => InfracaoStore()),
        Provider<MensagemStore>(create: (_) => MensagemStore()),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'SA TRANSPORTES',
      theme: CustomTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
