import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/services/ConnectivityService.dart';
import 'package:asistencias_v2/services/HttpServices.dart';
import 'package:asistencias_v2/constants/constants.dart'
    show genSecureStorageKey;
import 'package:asistencias_v2/providers/providers.dart'
    show FederacionProvider, GruposProvider;

abstract class GruposStorage {
  static final _secureKey = genSecureStorageKey('gruposPage');
  static final _storageGrupos = FlutterSecureStorage();
  static void storeData(BuildContext context, String data) async {
    Provider.of<GruposProvider>(context, listen: false).initGruposData(data);
    await _storageGrupos.write(key: _secureKey, value: data);
  }

  static void readData(
      BuildContext context, ConnectivityStatus connectionStatus) async {
    final gruposProvider = Provider.of<GruposProvider>(context, listen: false);
    final storedData = await _storageGrupos.read(key: _secureKey);

    if (storedData != null) return gruposProvider.initGruposData(storedData);

    if (connectionStatus == ConnectivityStatus.Offline) return;

    final requestBody = await _fetchData(context);
    if (requestBody == null) return;

    storeData(context, requestBody);
  }

  static void deleteData(BuildContext context) async {
    Provider.of<GruposProvider>(context, listen: false).clear();
    await _storageGrupos.delete(key: _secureKey);
  }
}

Future<String> _fetchData(BuildContext context) async {
  final federacionProvider =
      Provider.of<FederacionProvider>(context, listen: false);
  final uId = federacionProvider.waifu.uTrabajador[0] == ''
      ? federacionProvider.waifu.uCuenta
      : federacionProvider.waifu.uTrabajador;
  return await HttpServices.getGrupos(uId[0]);
}
