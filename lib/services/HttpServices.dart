import 'package:http/http.dart' as Http;
// * Custom
import 'package:asistencias_v2/constants/finals.dart' show baseHttpURL;

abstract class HttpServices {
  static Future<String> getGrupos(String uId) async {
    try {
      final requestURL = baseHttpURL + 'grupos/$uId/';
      Http.Response response = await Http.get(requestURL);
      return response.body;
    } catch (e) {
      print('Error pitudo $e');
      return null;
    }
  }

  static Future<String> getAlumnosList(
    String token,
    String endpoint,
    String grupoKey,
  ) async {
    try {
      String requestURL = baseHttpURL + 'alumnos/$token/$endpoint/$grupoKey/';
      Http.Response response = await Http.get(requestURL);
      return response.body;
    } catch (e) {
      print('Error pitudo $e');
      return null;
    }
  }
}
