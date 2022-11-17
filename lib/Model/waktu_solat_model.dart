// To parse this JSON data, do
//
//     final waktuSolat = waktuSolatFromJson(jsonString);

import 'dart:convert';

WaktuSolat waktuSolatFromJson(String str) =>
    WaktuSolat.fromJson(json.decode(str));

String waktuSolatToJson(WaktuSolat data) => json.encode(data.toJson());

class WaktuSolat {
  WaktuSolat({
    this.data,
  });

  List<Datum>? data;

  factory WaktuSolat.fromJson(Map<String, dynamic> json) => WaktuSolat(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.negeri,
    this.zon,
    this.waktuSolat,
  });

  String? negeri;
  String? zon;
  List<WaktuSolatElement>? waktuSolat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        negeri: json["negeri"],
        zon: json["zon"],
        waktuSolat: List<WaktuSolatElement>.from(
            json["waktu_solat"].map((x) => WaktuSolatElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "negeri": negeri,
        "zon": zon,
        "waktu_solat": List<dynamic>.from(waktuSolat!.map((x) => x.toJson())),
      };
}

class WaktuSolatElement {
  WaktuSolatElement({
    this.name,
    this.time,
  });

  String? name;
  String? time;

  factory WaktuSolatElement.fromJson(Map<String, dynamic> json) =>
      WaktuSolatElement(
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
      };
}
