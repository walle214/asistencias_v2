import 'package:flutter/material.dart';

export 'FederationStorage.dart';
export 'GruposStorage.dart';
export 'AlumnosStorage.dart';
// * custom
import 'FederationStorage.dart';
import 'GruposStorage.dart';
import 'AlumnosStorage.dart';

clearAllStorage(BuildContext context) {
  FederacionStorage.deleteData(context);
  GruposStorage.deleteData(context);
  AlumnosStorage.deleteData(context);
}
