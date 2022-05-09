// To parse this JSON data, do
//
//     final upcomingapi = upcomingapiFromJson(jsonString);

import 'dart:convert';

Upcomingapi upcomingapiFromJson(String str) => Upcomingapi.fromJson(json.decode(str));

String upcomingapiToJson(Upcomingapi data) => json.encode(data.toJson());

class Upcomingapi {
  Upcomingapi({
    this.result,
    this.matches,
    this.status,
  });

  String? result;
  Matches? matches;
  bool? status;

  factory Upcomingapi.fromJson(Map<String, dynamic> json) => Upcomingapi(
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
    this.notstarted,
  });

  List<Notstarted> ?notstarted;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
    notstarted: List<Notstarted>.from(json["NOTSTARTED"].map((x) => Notstarted.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NOTSTARTED": List<dynamic>.from(notstarted!.map((x) => x.toJson())),
  };
}

class Notstarted {
  Notstarted({
    this.quizavailable,
    this.team2Id,
    this.tispterWinnderDeclared,
    this.infoMsg,
    this.t1Over,
    this.type,
    this.t1Flag,
    this.i4Details,
    this.t1Run,
    this.team1Id,
    this.id,
    this.team2Name,
    this.i2Details,
    this.t2Flag,
    this.i1Details,
    this.i3Details,
    this.t1Wk,
    this.totalprediction,
    this.matchName,
    this.t2Wk,
    this.matchKey,
    this.startTime,
    this.team1Name,
    this.t2Over,
    this.t2Run,
    this.header,
    this.status,
  });

  bool? quizavailable;
  int? team2Id;
  bool? tispterWinnderDeclared;
  String? infoMsg;
  String? t1Over;
  int? type;
  String? t1Flag;
  Details? i4Details;
  int? t1Run;
  int? team1Id;
  int? id;
  String? team2Name;
  Details? i2Details;
  String? t2Flag;
  Details? i1Details;
  Details? i3Details;
  int? t1Wk;
  int? totalprediction;
  String? matchName;
  int? t2Wk;
  String? matchKey;
  int? startTime;
  String? team1Name;
  String? t2Over;
  int? t2Run;
  String? header;
  int? status;

  factory Notstarted.fromJson(Map<String, dynamic> json) => Notstarted(
    quizavailable: json["quizavailable"],
    team2Id: json["team2Id"],
    tispterWinnderDeclared: json["tispterWinnderDeclared"],
    infoMsg: json["infoMsg"],
    t1Over: json["t1over"],
    type: json["type"],
    t1Flag: json["t1Flag"],
    i4Details: Details.fromJson(json["i4details"]),
    t1Run: json["t1run"],
    team1Id: json["team1Id"],
    id: json["id"],
    team2Name: json["team2Name"],
    i2Details: Details.fromJson(json["i2details"]),
    t2Flag: json["t2Flag"],
    i1Details: Details.fromJson(json["i1details"]),
    i3Details: Details.fromJson(json["i3details"]),
    t1Wk: json["t1wk"],
    totalprediction: json["totalprediction"],
    matchName: json["matchName"],
    t2Wk: json["t2wk"],
    matchKey: json["matchKey"],
    startTime: json["start_time"],
    team1Name: json["team1Name"],
    t2Over: json["t2over"],
    t2Run: json["t2run"],
    header: json["header"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "quizavailable": quizavailable,
    "team2Id": team2Id,
    "tispterWinnderDeclared": tispterWinnderDeclared,
    "infoMsg": infoMsg,
    "t1over": t1Over,
    "type": type,
    "t1Flag": t1Flag,
    "i4details": i4Details!.toJson(),
    "t1run": t1Run,
    "team1Id": team1Id,
    "id": id,
    "team2Name": team2Name,
    "i2details": i2Details!.toJson(),
    "t2Flag": t2Flag,
    "i1details": i1Details!.toJson(),
    "i3details": i3Details!.toJson(),
    "t1wk": t1Wk,
    "totalprediction": totalprediction,
    "matchName": matchName,
    "t2wk": t2Wk,
    "matchKey": matchKey,
    "start_time": startTime,
    "team1Name": team1Name,
    "t2over": t2Over,
    "t2run": t2Run,
    "header": header,
    "status": status,
  };
}

class Details {
  Details({
    this.over,
    this.inid,
    this.wk,
    this.batTeamId,
    this.bowlTeamId,
    this.mId,
    this.run,
    this.id,
  });

  String? over;
  int? inid;
  int? wk;
  int? batTeamId;
  int? bowlTeamId;
  int? mId;
  int? run;
  int? id;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    over: json["over"],
    inid: json["inid"],
    wk: json["wk"],
    batTeamId: json["batTeamId"],
    bowlTeamId: json["BowlTeamId"],
    mId: json["mId"],
    run: json["run"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "over": over,
    "inid": inid,
    "wk": wk,
    "batTeamId": batTeamId,
    "BowlTeamId": bowlTeamId,
    "mId": mId,
    "run": run,
    "id": id,
  };
}
