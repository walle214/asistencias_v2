import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/models/models.dart' show AlumnosData;
import 'package:asistencias_v2/providers/providers.dart' show AlumnosProvider;
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show AlumnoButtonColorStatus;

class ClaseData {
  final String _idGrupo;
  final String _idClase;
  final int _horas;
  int currentHour = 0;
  List<AlumnoButtonColorStatus> asistencias = List();

  ClaseData(
    this._idClase,
    this._idGrupo,
    this._horas,
  );
  set asistenciasLength(int length) {
    asistencias = List.filled(length, AlumnoButtonColorStatus.VERDE);
    //asistencias = asistencias.map((e) => e = ButtonColorStatus.verde).toList();
  }

  int get horas => _horas;

  AlumnosData getAlumnos(BuildContext context) {
    final alumnosProvider =
        Provider.of<AlumnosProvider>(context, listen: false);
    return alumnosProvider.getAlumnosData(_idGrupo);
  }
}
