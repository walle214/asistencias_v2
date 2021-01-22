import 'package:http/http.dart' as Http;
// * Custom
import 'package:asistencias_v2/constants/finals.dart' show baseHttpURL;

abstract class HttpServices {
  static Future<String> getGrupos(String uId) async {
    final requestURL = baseHttpURL + 'grupos/$uId/';
    Http.Response response = await Http.get(requestURL);
    return response.body;
  }

  static Future<String> getAlumnosList(
    String token,
    String endpoint,
    String grupoKey,
  ) async {
    String requestURL = baseHttpURL + 'alumnos/$token/$endpoint/$grupoKey/';
    Http.Response response = await Http.get(requestURL);
    return response.body;
  }
}
