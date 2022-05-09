// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.news,
    this.result,
    this.status,
  });

  List<NewsElement>? news;
  String? result;
  bool? status;

  factory News.fromJson(Map<String, dynamic> json) => News(
    news: List<NewsElement>.from(json["news"].map((x) => NewsElement.fromJson(x))),
    result: json["result"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "news": news,
    "result": result,
    "status": status,
  };
}

class NewsElement {
  NewsElement({
    this.smallDesc,
    this.image,
    this.newsSource,
    this.id,
    this.time,
    this.title,
    this.newsType,
  });

  String? smallDesc;
  String? image;
  String? newsSource;
  int? id;
  int? time;
  String? title;
  String? newsType;

  factory NewsElement.fromJson(Map<String, dynamic> json) => NewsElement(
    smallDesc: json["smallDesc"],
    image: json["image"],
    newsSource: json["newsSource"],
    id: json["id"],
    time: json["time"],
    title: json["title"],
    newsType: json["newsType"],
  );

  Map<String, dynamic> toJson() => {
    "smallDesc": smallDesc,
    "image": image,
    "newsSource": newsSource,
    "id": id,
    "time": time,
    "title": title,
    "newsType": newsType,
  };
}
