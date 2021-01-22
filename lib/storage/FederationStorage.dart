import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/constants/constants.dart'
    show genSecureStorageKey;
import 'package:asistencias_v2/providers/providers.dart'
    show FederacionProvider;

abstract class FederacionStorage {
  static final _secureKey = genSecureStorageKey('federationPage');
  static final _storageFederation = FlutterSecureStorage();
  static Future<void> storeData(BuildContext context, String data) async {
    final federacionProvider =
        Provider.of<FederacionProvider>(context, listen: false);
    federacionProvider.initWaifuData(data);
    await _storageFederation.write(key: _secureKey, value: data);
  }

  static void readData(BuildContext context) async {
    final storedData = await _storageFederation.read(key: _secureKey);
    if (storedData != null)
      Provider.of<FederacionProvider>(context, listen: false)
          .initWaifuData(storedData);
  }

  static void deleteData(BuildContext context) async {
    Provider.of<FederacionProvider>(context, listen: false).clear();
    await _storageFederation.delete(key: _secureKey);
  }
}
