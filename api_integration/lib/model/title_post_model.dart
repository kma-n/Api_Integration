// To parse this JSON data, do
//
//     final title = titleFromJson(jsonString);

import 'dart:convert';

Title titleFromJson(String str) => Title.fromJson(json.decode(str));

String titleToJson(Title data) => json.encode(data.toJson());

class Title {
  Title({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  String? body;
  int? id;
  String? title;
  String? userId;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
