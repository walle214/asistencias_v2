import 'package:asistencias_v2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/models/models.dart' show AlumnosData, ClaseData;

class ClasesProvider with ChangeNotifier {
  Map<String, ClaseData> _clases = Map();

  ClaseData getClaseData({
    @required String idGrupo,
    @required String idMateria,
  }) =>
      _clases['$idGrupo-$idMateria'];

  ClaseData addClaseData({
    @required int horas,
    @required String idGrupo,
    @required String idMateria,
  }) {
    _clases['$idGrupo-$idMateria'] =
        _clases['$idGrupo-$idMateria'] ?? ClaseData(idMateria, idGrupo, horas);
    //notifyListeners();
    return _clases['$idGrupo-$idMateria'];
  }

  AlumnosData getAlumnosList(
    BuildContext context, {
    @required String idGrupo,
    @required String idClase,
  }) {
    final alumnosProvider = Provider.of<AlumnosProvider>(context);
    return alumnosProvider.getAlumnosData(idGrupo);
  }

  void changeLength(int length, String grupoKey) {
    _clases.keys.forEach(
      (key) {
        final idGrupo = key.split('-')[0];
        if (grupoKey == idGrupo) _clases[key].asistenciasLength = length;
      },
    );
    notifyListeners();
  }
}
