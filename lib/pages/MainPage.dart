import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/storage/storage.dart' show FederacionStorage;
import 'package:asistencias_v2/widgets/buttons/buttons.dart';
import 'package:asistencias_v2/providers/providers.dart'
    show FederacionProvider;

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  _handleOnPressed(BuildContext context, bool logged) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      logged ? 'plantel' : 'federationLogin',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.4;
    final logged = !Provider.of<FederacionProvider>(context).isEmpty;
    if (!logged) FederacionStorage.readData(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildren(imageWidth, logged),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(double imageWidth, bool logged) {
    return [
      Image(
        width: imageWidth,
        image: AssetImage('assets/ucolLogos/ucol80.png'),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          'Control de asistencias',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        width: double.infinity,
        child: LightBlueButton(
            'Iniciar sesión', (context) => _handleOnPressed(context, logged)),
      )
    ];
  }
}
