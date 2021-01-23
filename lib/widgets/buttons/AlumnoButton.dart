import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// * Custom
import 'package:asistencias_v2/constants/constants.dart' show CustomColors;
import 'package:asistencias_v2/providers/providers.dart' show ClasesProvider;
import 'package:provider/provider.dart';

enum AlumnoButtonColorStatus { VERDE, ROJO, AZUL, AMARILLO }

class AlumnoButton extends StatefulWidget {
  final String alumnoName;
  final AlumnoButtonColorStatus status;
  final int delay;
  final int index;
  final String claseString;
  AlumnoButton({
    Key key,
    @required this.alumnoName,
    @required this.claseString,
    this.status = AlumnoButtonColorStatus.VERDE,
    this.delay,
    this.index,
  }) : super(key: key);

  @override
  _AlumnoButtonState createState() => _AlumnoButtonState(status: status);
}

class _AlumnoButtonState extends State<AlumnoButton> {
  Color color, darkColor;
  AlumnoButtonColorStatus status;
  IconData iconData;

  _AlumnoButtonState({this.status});

  @override
  Widget build(BuildContext context) {
    selectColors();
    return _buildBody();
  }

  Padding _buildBody() {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0, right: 15.0, left: 15.0),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTapHandler,
          child: Container(
            height: 58.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        widget.alumnoName,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(color: darkColor, width: 58.0, height: 58.0),
                      Positioned(
                        top: 8.0,
                        left: 8.0,
                        bottom: 8.0,
                        right: 8.0,
                        child: Container(
                          height: 42.0,
                          width: 42.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: color),
                        ),
                      ),
                      Positioned(
                        top: 11.0,
                        left: 12.0,
                        bottom: 12.0,
                        right: 12.0,
                        child: Icon(iconData, color: darkColor, size: 34.0),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void selectColors() {
    switch (status) {
      case AlumnoButtonColorStatus.ROJO:
        color = CustomColors.red;
        darkColor = CustomColors.darkRed;
        iconData = FontAwesomeIcons.times;
        break;
      case AlumnoButtonColorStatus.AMARILLO:
        color = CustomColors.yellow;
        darkColor = CustomColors.darkYellow;
        iconData = FontAwesomeIcons.solidClock;
        break;
      case AlumnoButtonColorStatus.VERDE:
        color = CustomColors.green;
        darkColor = CustomColors.darkGreen;
        iconData = FontAwesomeIcons.check;
        break;
      case AlumnoButtonColorStatus.AZUL:
        color = CustomColors.blue;
        darkColor = CustomColors.lowDarkBlue;
        iconData = FontAwesomeIcons.stickyNote;
        break;
    }
    final idGrupo = widget.claseString.split('-')[0];
    final idClase = widget.claseString.split('-')[1];

    Provider.of<ClasesProvider>(context, listen: false)
        .getClaseData(idGrupo: idGrupo, idMateria: idClase)
        .asistencias[widget.index] = status;
  }

  void onTapHandler() {
    setState(
      () {
        switch (status) {
          case AlumnoButtonColorStatus.ROJO:
            status = AlumnoButtonColorStatus.VERDE;
            break;
          case AlumnoButtonColorStatus.VERDE:
            status = AlumnoButtonColorStatus.AMARILLO;
            break;
          case AlumnoButtonColorStatus.AMARILLO:
            status = AlumnoButtonColorStatus.ROJO;
            break;
          default:
            break;
        }
      },
    );
  }
}
