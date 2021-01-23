import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/widgets/buttons/buttons.dart';

class WebViewFallback extends StatelessWidget {
  const WebViewFallback({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildren(imageWidth),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(double imageWidth) {
    return [
      Image(
        width: imageWidth,
        image: AssetImage('assets/ucolLogos/ucol80.png'),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          'Sin conexión a internet',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        width: double.infinity,
        child: LightBlueButton('Volver', (context) {
          Navigator.pop(context);
        }, animate: false),
      )
    ];
  }
}
