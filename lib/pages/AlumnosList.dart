import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show AlumnoButton, LightBlueButton;
import 'package:asistencias_v2/storage/storage.dart' show AlumnosStorage;
import 'package:asistencias_v2/providers/providers.dart'
    show AlumnosProvider, ClasesProvider;
import 'package:asistencias_v2/services/ConnectivityService.dart';
import 'package:asistencias_v2/widgets/widgets.dart' show TemplatePage;

class AlumnosList extends StatelessWidget {
  // final int indexPlantel;
  // final int indexCarrera;
  final String carreraNombre;
  final String materiaNombre;
  final String idGrupo;
  final String idMateria;
  final int horas;
  const AlumnosList({
    Key key,
    this.carreraNombre,
    this.materiaNombre,
    @required this.idGrupo,
    @required this.idMateria,
    @required this.horas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: _body(context),
      title: carreraNombre,
      subtitle: materiaNombre,
    );
  }

  _body(BuildContext context) {
    final clasesProvider = Provider.of<ClasesProvider>(context);
    final alumnosProvider = Provider.of<AlumnosProvider>(context);
    final connectionStatus = Provider.of<ConnectivityStatus>(context);
    final clase = clasesProvider.getClaseData(
          idGrupo: idGrupo,
          idMateria: idMateria,
        ) ??
        clasesProvider.addClaseData(
          horas: horas,
          idGrupo: idGrupo,
          idMateria: idMateria,
        );

    final alumnosData = alumnosProvider.getAlumnosData(idGrupo);
    if (alumnosData == null) {
      AlumnosStorage.readData(context, idGrupo, connectionStatus);
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: alumnosData.alumnos.length + 1,
      itemBuilder: (context, i) {
        if (i < alumnosData.alumnos.length) {
          final alumno = alumnosData.alumnos[i];
          return AlumnoButton(
              index: i,
              claseString: '$idGrupo-$idMateria',
              alumnoName: alumno.nombre,
              delay: i,
              status: clase.asistencias[i]);
        }
        return _SaveButton();
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(color: Colors.black54, indent: 20.0, height: 40.0),
        LightBlueButton(
          'Guardar Asistencias',
          (context) {
            print('Guardar Asistencias');
          },
          animate: false,
        ),
      ],
    );
  }
}
