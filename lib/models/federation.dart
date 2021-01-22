import 'dart:convert';

class WaifuData {
  final List<String> uCorreo;
  final List<String> uNombre;
  final List<String> uCuenta;
  final List<String> uTrabajador;
  final List<String> uTipo;
  final List<String> uDependencia;
  final List<String> cn;
  final List<String> sn;
  final List<String> givenName;
  final List<String> displayName;
  final List<String> immutableId;

  WaifuData({
    this.uCorreo,
    this.uNombre,
    this.uCuenta,
    this.uTrabajador,
    this.uTipo,
    this.uDependencia,
    this.cn,
    this.sn,
    this.givenName,
    this.displayName,
    this.immutableId,
  });

  factory WaifuData.fromRawJson(String str) =>
      WaifuData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WaifuData.fromJson(Map<String, dynamic> json) => WaifuData(
        uCorreo: List<String>.from(json["uCorreo"].map((x) => x)),
        uNombre: List<String>.from(json["uNombre"].map((x) => x)),
        uCuenta: List<String>.from(json["uCuenta"].map((x) => x)),
        uTrabajador: List<String>.from(json["uTrabajador"].map((x) => x)),
        uTipo: List<String>.from(json["uTipo"].map((x) => x)),
        uDependencia: List<String>.from(json["uDependencia"].map((x) => x)),
        cn: List<String>.from(json["cn"].map((x) => x)),
        sn: List<String>.from(json["sn"].map((x) => x)),
        givenName: List<String>.from(json["givenName"].map((x) => x)),
        displayName: List<String>.from(json["displayName"].map((x) => x)),
        immutableId: List<String>.from(json["ImmutableID"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uCorreo": List<dynamic>.from(uCorreo.map((x) => x)),
        "uNombre": List<dynamic>.from(uNombre.map((x) => x)),
        "uCuenta": List<dynamic>.from(uCuenta.map((x) => x)),
        "uTrabajador": List<dynamic>.from(uTrabajador.map((x) => x)),
        "uTipo": List<dynamic>.from(uTipo.map((x) => x)),
        "uDependencia": List<dynamic>.from(uDependencia.map((x) => x)),
        "cn": List<dynamic>.from(cn.map((x) => x)),
        "sn": List<dynamic>.from(sn.map((x) => x)),
        "givenName": List<dynamic>.from(givenName.map((x) => x)),
        "displayName": List<dynamic>.from(displayName.map((x) => x)),
        "ImmutableID": List<dynamic>.from(immutableId.map((x) => x)),
      };
}
