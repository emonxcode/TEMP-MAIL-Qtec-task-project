// To parse this JSON data, do
//
//     final email = emailFromJson(jsonString);

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
  String id;
  String msgid;
  Entity from;
  List<Entity> to;
  String subject;
  String intro;
  bool seen;
  bool isDeleted;
  bool hasAttachments;
  int size;
  String downloadUrl;
  String sourceUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String accountId;

  Email({
    required this.id,
    required this.msgid,
    required this.from,
    required this.to,
    required this.subject,
    required this.intro,
    required this.seen,
    required this.isDeleted,
    required this.hasAttachments,
    required this.size,
    required this.downloadUrl,
    required this.sourceUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.accountId,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        msgid: json["msgid"],
        from: Entity.fromJson(json["from"]),
        to: List<Entity>.from(json["to"].map((x) => Entity.fromJson(x))),
        subject: json["subject"],
        intro: json["intro"],
        seen: json["seen"],
        isDeleted: json["isDeleted"],
        hasAttachments: json["hasAttachments"],
        size: json["size"],
        downloadUrl: json["downloadUrl"],
        sourceUrl: json["sourceUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        accountId: json["accountId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "msgid": msgid,
        "from": from.toJson(),
        "to": List<dynamic>.from(to.map((x) => x.toJson())),
        "subject": subject,
        "intro": intro,
        "seen": seen,
        "isDeleted": isDeleted,
        "hasAttachments": hasAttachments,
        "size": size,
        "downloadUrl": downloadUrl,
        "sourceUrl": sourceUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "accountId": accountId,
      };
}

class Entity {
  String address;
  String name;

  Entity({
    required this.address,
    required this.name,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        address: json["address"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
      };
}
