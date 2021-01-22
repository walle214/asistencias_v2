import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart' as AnimateDo;

// * Custom
import 'package:asistencias_v2/constants/constants.dart';

class BackButtonBlue extends StatelessWidget {
  const BackButtonBlue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimateDo.SlideInUp(
      child: Container(
        height: 50,
        width: size.width,
        child: FlatButton.icon(
          shape: RoundedRectangleBorder(),
          color: CustomColors.darkBlue,
          textColor: Colors.white,
          onPressed: () => Navigator.pop(context),
          icon: Icon(FontAwesomeIcons.arrowLeft),
          label: Text('Regresar', style: TextStyle(fontSize: 18.0)),
        ),
      ),
    );
  }
}
