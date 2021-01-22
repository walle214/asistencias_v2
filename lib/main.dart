// * Packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statusbar/statusbar.dart';

// * Custom
import 'package:asistencias_v2/constants/constants.dart' show CustomColors;
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

MaterialApp _mainApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Asistencias V2',
    initialRoute: '/',
    routes: {
      '/': (context) => MainPage(),
      'federationLogin': (context) => FederationLogin(),
    },
  );
}
