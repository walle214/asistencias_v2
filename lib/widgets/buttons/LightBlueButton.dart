import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart' as AnimateDo;
// * Custom
import 'package:asistencias_v2/constants/constants.dart'
    show CustomColors, delayButtons;

typedef LightBlueCallback = void Function(BuildContext context);

class LightBlueButton extends StatelessWidget {
  static Color color = CustomColors.blue;
  final LightBlueCallback onPressed;
  final String text;
  final int delay;
  final bool animate;
  const LightBlueButton(
    this.text,
    this.onPressed, {
    Key key,
    this.delay = 0,
    this.animate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0),
      child: animate
          ? AnimateDo.ZoomIn(
              delay: Duration(milliseconds: delay * delayButtons),
              child: _buildRaisedButton(context),
            )
          : _buildRaisedButton(context),
    );
  }

  FlatButton _buildRaisedButton(BuildContext context) {
    return FlatButton(
      color: color,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
        ),
      ),
      onPressed: () => onPressed(context),
    );
  }
}
