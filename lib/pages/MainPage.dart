import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/widgets/buttons/buttons.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                'Iniciar sesión',
                (context) => Navigator.pushNamedAndRemoveUntil(
                  context,
                  'federationLogin',
                  (route) => false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
