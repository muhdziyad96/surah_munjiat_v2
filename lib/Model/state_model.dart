// To parse this JSON data, do
//
//     final state = stateFromJson(jsonString);

import 'dart:convert';

State stateFromJson(String str) => State.fromJson(json.decode(str));

String stateToJson(State data) => json.encode(data.toJson());

class State {
  State({
    this.data,
  });

  Data? data;

  factory State.fromJson(Map<String, dynamic> json) => State(
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

  List<String>? negeri;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        negeri: List<String>.from(json["negeri"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "negeri": List<dynamic>.from(negeri!.map((x) => x)),
      };
}
