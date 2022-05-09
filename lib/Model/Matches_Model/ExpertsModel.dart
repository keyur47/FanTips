// To parse this JSON data, do
//
//     final expert = expertFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

Expert expertFromJson(String str) => Expert.fromJson(json.decode(str));

String expertToJson(Expert data) => json.encode(data.toJson());

class Expert {
  Expert({
    this.result,
    this.tipsters,
    this.status,
  });

  String? result;
  List<Tipster>? tipsters;
  bool? status;


  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
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
    this.inWishList,
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
  RxBool? inWishList;

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
      inWishList: false.obs,
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
