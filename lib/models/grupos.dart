// To parse this JSON data, do
//
//     final gruposData = gruposDataFromJson(jsonString);

// import 'dart:convert';

import 'dart:convert';

class GruposData {
  final String id;
  final String token;
  final String endpoint;
  final String nombre;
  final List<Plantel> plantel;

  GruposData({
    this.id,
    this.token,
    this.endpoint,
    this.nombre,
    this.plantel,
  });

  factory GruposData.fromRawJson(String str) =>
      GruposData.fromJson(json.decode(str)[0]);

  String toRawJson() => json.encode(toJson());

  factory GruposData.fromJson(Map<String, dynamic> json) => GruposData(
        id: json["id"],
        token: json["token"],
        endpoint: json["endpoint"],
        nombre: json["nombre"],
        plantel:
            List<Plantel>.from(json["plantel"].map((x) => Plantel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "endpoint": endpoint,
        "nombre": nombre,
        "plantel": List<dynamic>.from(plantel.map((x) => x.toJson())),
      };
}

class Plantel {
  final String id;
  final String clave;
  final String nombre;
  final List<Carrera> carreras;

  Plantel({
    this.id,
    this.clave,
    this.nombre,
    this.carreras,
  });

  factory Plantel.fromRawJson(String str) => Plantel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plantel.fromJson(Map<String, dynamic> json) => Plantel(
        id: json["id"],
        clave: json["clave"],
        nombre: json["nombre"],
        carreras: List<Carrera>.from(
            json["carreras"].map((x) => Carrera.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clave": clave,
        "nombre": nombre,
        "carreras": List<dynamic>.from(carreras.map((x) => x.toJson())),
      };
}

class Carrera {
  final String idcarrera;
  final String nombre;
  final String coordinador;
  final String orientador;
  final String justificacion;
  final String tutor;
  final List<Semestre> semestres;

  Carrera({
    this.idcarrera,
    this.nombre,
    this.coordinador,
    this.orientador,
    this.justificacion,
    this.tutor,
    this.semestres,
  });

  factory Carrera.fromRawJson(String str) => Carrera.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        idcarrera: json["idcarrera"] == null ? null : json["idcarrera"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        coordinador: json["coordinador"],
        orientador: json["orientador"],
        justificacion: json["justificacion"],
        tutor: json["tutor"],
        semestres: List<Semestre>.from(
            json["semestres"].map((x) => Semestre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idcarrera": idcarrera == null ? null : idcarrera,
        "nombre": nombre == null ? null : nombre,
        "coordinador": coordinador,
        "orientador": orientador,
        "justificacion": justificacion,
        "tutor": tutor,
        "semestres": List<dynamic>.from(semestres.map((x) => x.toJson())),
      };
}

class Semestre {
  final String id;
  final String nombre;
  final List<Grupo> grupos;

  Semestre({
    this.id,
    this.nombre,
    this.grupos,
  });

  factory Semestre.fromRawJson(String str) =>
      Semestre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Semestre.fromJson(Map<String, dynamic> json) => Semestre(
        id: json["id"],
        nombre: json["nombre"],
        grupos: List<Grupo>.from(json["grupos"].map((x) => Grupo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "grupos": List<dynamic>.from(grupos.map((x) => x.toJson())),
      };
}

class Grupo {
  final String id;
  final String nombre;
  final List<Materia> materias;

  Grupo({
    this.id,
    this.nombre,
    this.materias,
  });

  factory Grupo.fromRawJson(String str) => Grupo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        id: json["id"],
        nombre: json["nombre"],
        materias: List<Materia>.from(
            json["materias"].map((x) => Materia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "materias": List<dynamic>.from(materias.map((x) => x.toJson())),
      };
}

class Materia {
  final String id;
  final String nombre;
  final String horas;

  Materia({
    this.id,
    this.nombre,
    this.horas,
  });

  factory Materia.fromRawJson(String str) => Materia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        id: json["id"],
        nombre: json["nombre"],
        horas: json["horas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "horas": horas,
      };
}
