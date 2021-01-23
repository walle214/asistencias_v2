import 'dart:convert';
import 'package:meta/meta.dart';

class AlumnosData {
  final String id;
  final String token;
  final List<Alumno> alumnos;

  AlumnosData({
    @required this.id,
    @required this.token,
    @required this.alumnos,
  });

  AlumnosData copyWith({
    String id,
    String token,
    List<Alumno> alumnos,
  }) =>
      AlumnosData(
        id: id ?? this.id,
        token: token ?? this.token,
        alumnos: alumnos ?? this.alumnos,
      );

  factory AlumnosData.fromRawJson(String str) =>
      AlumnosData.fromJson(json.decode(str)[0]);

  String toRawJson() => json.encode(toJson());

  factory AlumnosData.fromJson(Map<String, dynamic> json) => AlumnosData(
        id: json["id"],
        token: json["token"],
        alumnos:
            List<Alumno>.from(json["alumnos"].map((x) => Alumno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "alumnos": List<dynamic>.from(alumnos.map((x) => x.toJson())),
      };
}

class Alumno {
  final String id;
  final String nombre;
  final String materias;

  Alumno({
    @required this.id,
    @required this.nombre,
    @required this.materias,
  });

  Alumno copyWith({
    String id,
    String nombre,
    String materias,
  }) =>
      Alumno(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        materias: materias ?? this.materias,
      );

  factory Alumno.fromRawJson(String str) => Alumno.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        id: json["id"],
        nombre: json["nombre"],
        materias: json["materias"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "materias": materias,
      };
}
