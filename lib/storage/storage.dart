export 'FederationStorage.dart';
export 'GruposStorage.dart';
import 'package:flutter/material.dart';
// * custom
import 'FederationStorage.dart';
import 'GruposStorage.dart';

clearAllStorage(BuildContext context) {
  FederacionStorage.deleteData(context);
  GruposStorage.deleteData(context);
}
