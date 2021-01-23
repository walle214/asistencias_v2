import 'dart:convert';
import 'package:asistencias_v2/services/ConnectivityService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/services/HttpServices.dart';
import 'package:asistencias_v2/constants/constants.dart'
    show genSecureStorageKey;
import 'package:asistencias_v2/providers/providers.dart'
    show AlumnosProvider, ClasesProvider, GruposProvider;

abstract class AlumnosStorage {
  static final _secureKey = genSecureStorageKey('alumnosList');
  static final _storageAlumnos = FlutterSecureStorage();

  static void storeData(
    BuildContext context,
    String data,
    String keyGrupo,
  ) async {
    // * Update clase/alumnos provider
    Provider.of<ClasesProvider>(context, listen: false).changeLength(
        Provider.of<AlumnosProvider>(context, listen: false)
            .addAlumnosData(data, keyGrupo)
            .alumnos
            .length,
        keyGrupo);
    dynamic storedData = await _storageAlumnos.read(key: _secureKey);
    storedData = storedData == null ? {} : jsonDecode(storedData);
    storedData[keyGrupo] = data;
    await _storageAlumnos.write(key: _secureKey, value: jsonEncode(storedData));
  }

  static void readData(BuildContext context, String idGrupo,
      ConnectivityStatus connectionStatus) async {
    final alumnosProvider =
        Provider.of<AlumnosProvider>(context, listen: false);
    final storedData = await _storageAlumnos.read(key: _secureKey);
    if (storedData != null && jsonDecode(storedData)[idGrupo] != null)
      alumnosProvider.addAlumnosData(jsonDecode(storedData)[idGrupo], idGrupo);

    if (connectionStatus == ConnectivityStatus.Offline) return;

    final requestBody = await _fetchData(context, idGrupo);
    if (requestBody == null) return;
    storeData(context, requestBody, idGrupo);
  }

  static void deleteData(BuildContext context) async {
    Provider.of<AlumnosProvider>(context, listen: false).clear();
    await _storageAlumnos.delete(key: _secureKey);
  }
}

Future<String> _fetchData(BuildContext context, String grupoKey) async {
  final data = Provider.of<GruposProvider>(context, listen: false).data;

  return await HttpServices.getAlumnosList(data.token, data.endpoint, grupoKey);
}
