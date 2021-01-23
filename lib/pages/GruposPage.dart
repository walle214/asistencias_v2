import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/pages/pages.dart' show AlumnosList;
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show LightBlueButton;
import 'package:asistencias_v2/models/models.dart' show Carrera;
import 'package:asistencias_v2/widgets/widgets.dart' show TemplatePage;

class GruposPage extends StatelessWidget {
  final Carrera carrera;
  final String title;
  const GruposPage({
    Key key,
    @required this.carrera,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = _body(context);
    return TemplatePage(
      child: ListView.builder(
        itemCount: buttons.length,
        itemBuilder: (context, i) => buttons[i],
      ),
      title: title,
    );
  }

  List<LightBlueButton> _body(BuildContext context) {
    int count = 0;
    final gruposBtns = List<LightBlueButton>();

    carrera.semestres.forEach(
      (s) => s.grupos.forEach(
        (g) => g.materias.forEach(
          (m) {
            count++;
            final buttonText = '${s.nombre} ${g.nombre} - ${m.nombre}';
            gruposBtns.add(
              LightBlueButton(buttonText, (constext) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlumnosList(
                      carreraNombre: title,
                      materiaNombre: buttonText,
                      idGrupo: g.id,
                      idMateria: m.id,
                      horas: int.parse(m.horas),
                    ),
                  ),
                );
              }, delay: count),
            );
          },
        ),
      ),
    );
    return gruposBtns;
  }
}
