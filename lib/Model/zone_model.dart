// To parse this JSON data, do
//
//     final zone = zoneFromJson(jsonString);

import 'dart:convert';

Zone zoneFromJson(String str) => Zone.fromJson(json.decode(str));

String zoneToJson(Zone data) => json.encode(data.toJson());

class Zone {
  Zone({
    this.data,
  });

  Data? data;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.negeri,
  });

  Negeri? negeri;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        negeri: Negeri.fromJson(json["negeri"]),
      );

  Map<String, dynamic> toJson() => {
        "negeri": negeri!.toJson(),
      };
}

class Negeri {
  Negeri({
    this.nama,
    this.zon,
  });

  String? nama;
  List<String>? zon;

  factory Negeri.fromJson(Map<String, dynamic> json) => Negeri(
        nama: json["nama"],
        zon: List<String>.from(json["zon"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "zon": List<dynamic>.from(zon!.map((x) => x)),
      };
}
