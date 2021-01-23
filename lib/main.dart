// * Packages
import 'package:asistencias_v2/services/ConnectivityService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:statusbar/statusbar.dart';

// * Custom
import 'package:asistencias_v2/constants/constants.dart' show CustomColors;
import 'package:asistencias_v2/providers/providers.dart';
import 'package:asistencias_v2/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(AsistenciasV2());
  });
}

class AsistenciasV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusBar.color(CustomColors.darkBlue);
    return _mainApp();
  }
}

_mainApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FederacionProvider()),
      ChangeNotifierProvider(create: (context) => GruposProvider()),
      ChangeNotifierProvider(create: (context) => AlumnosProvider()),
      ChangeNotifierProvider(create: (context) => ClasesProvider()),
      StreamProvider<ConnectivityStatus>(
        create: (context) =>
            ConnectivityService().connectionStatusController.stream,
        initialData: ConnectivityStatus.Offline,
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asistencias V2',
      initialRoute: '/',
      routes: {
        '/': (_) => MainPage(),
        'federationLogin': (_) => FederationLogin(),
        'plantel': (_) => PlantelPage(),
        'webviewFallback': (_) => WebViewFallback(),
      },
    ),
  );
}
