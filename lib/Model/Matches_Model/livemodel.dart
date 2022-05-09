// To parse this JSON data, do
//
//     final liveapi = liveapiFromJson(jsonString);

import 'dart:convert';

Liveapi liveapiFromJson(String str) => Liveapi.fromJson(json.decode(str));

String liveapiToJson(Liveapi data) => json.encode(data.toJson());

class Liveapi {
  Liveapi({
    this.result,
    this.matches,
    this.status,
  });

  String? result;
  Matches? matches;
  bool? status;

  factory Liveapi.fromJson(Map<String, dynamic> json) => Liveapi(
    result: json["result"],
    matches: Matches.fromJson(json["matches"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "matches": matches!.toJson(),
    "status": status,
  };
}

class Matches {
  Matches({
    this.started,
  });

  List<dynamic> ?started;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
    started: List<dynamic>.from(json["STARTED"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "STARTED": List<dynamic>.from(started!.map((x) => x)),
  };
}
