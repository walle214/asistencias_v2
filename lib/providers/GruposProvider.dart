import 'package:flutter/material.dart';
// * customClass
import 'package:asistencias_v2/models/models.dart' show GruposData;

class GruposProvider with ChangeNotifier {
  GruposData data;
  GruposProvider() {
    this.data = null;
  }
  bool get isEmpty => this.data == null;

  void clear() => this.data = null;

  void notify() => notifyListeners();

  void initGruposData(String rawString) {
    // print(rawString);
    data = GruposData.fromRawJson(rawString);
    notifyListeners();
  }
}
