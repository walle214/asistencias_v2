import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/models/models.dart' show AlumnosData;

class AlumnosProvider with ChangeNotifier {
  Map<String, AlumnosData> _data = Map();

  bool get isEmpty => this._data == null;

  void clear() => this._data = null;

  void notify() => notifyListeners();

  AlumnosData addAlumnosData(String rowData, String keyGrupo) {
    final alumnos = AlumnosData.fromRawJson(rowData);
    _data[keyGrupo] = alumnos;
    notifyListeners();
    return alumnos;
  }

  AlumnosData getAlumnosData(String keyGrupo) {
    if (_data == null) _data = <String, AlumnosData>{};
    return _data[keyGrupo];
  }
}
