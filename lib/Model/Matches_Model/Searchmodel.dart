// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.result,
    this.tipsters,
    this.status,
  });

  String? result;
  List<Tipster>? tipsters;
  bool? status;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    result: json["result"],
    tipsters: List<Tipster>.from(json["tipsters"].map((x) => Tipster.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "tipsters": List<dynamic>.from(tipsters!.map((x) => x.toJson())),
    "status": status,
  };
}

class Tipster {
  Tipster({
    this.sourceUrl,
    this.profileUrl,
    this.avgScore,
    this.totalPredictions,
    this.subscriberCount,
    this.name,
    this.top3,
    this.active,
    this.id,
    this.platform,
  });

  String? sourceUrl;
  String? profileUrl;
  int? avgScore;
  int? totalPredictions;
  String? subscriberCount;
  String? name;
  int? top3;
  bool? active;
  int? id;
  String? platform;

  factory Tipster.fromJson(Map<String, dynamic> json) => Tipster(
    sourceUrl: json["sourceUrl"],
    profileUrl: json["profileUrl"],
    avgScore: json["avgScore"],
    totalPredictions: json["totalPredictions"],
    subscriberCount: json["subscriberCount"],
    name: json["name"],
    top3: json["top3"],
    active: json["active"],
    id: json["id"],
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "sourceUrl": sourceUrl,
    "profileUrl": profileUrl,
    "avgScore": avgScore,
    "totalPredictions": totalPredictions,
    "subscriberCount": subscriberCount,
    "name": name,
    "top3": top3,
    "active": active,
    "id": id,
    "platform": platform,
  };
}
