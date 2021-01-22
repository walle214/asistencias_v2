import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/models/models.dart' show WaifuData;

class FederacionProvider with ChangeNotifier {
  WaifuData waifu;

  FederacionProvider() {
    waifu = null;
  }

  initWaifuData(String data) {
    waifu = WaifuData.fromRawJson(data);
    notifyListeners();
  }

  // void notify() => notifyListeners();

  bool get isEmpty => waifu == null;

  void clear() {
    waifu = null;
    notifyListeners();
  }
}
